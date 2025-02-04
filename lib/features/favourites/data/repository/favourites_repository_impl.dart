import 'package:get/get.dart';
import 'package:hotel_booking/features/favourites/data/repository/favourites_repository.dart';
import 'package:hotel_booking/features/home/data/models/hotel_item_dto.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast_io.dart';

import '../../../../core/exception/db_connection_exception.dart';
import '../../../../l10n/app_localizations.dart';

class FavouritesRepositoryImpl implements FavouritesRepository {
  final _kDbFileName = 'my_hotels.db';

  Database? _database;

  late StoreRef<String, Map<String, dynamic>> _hotelsStore;

  @override
  Future<bool> initDb() async {
    if (_database != null) {
      return true;
    }
    try {
      final appDocumentDir = await getApplicationDocumentsDirectory();
      final dbPath = join(appDocumentDir.path, _kDbFileName);
      _database = await databaseFactoryIo.openDatabase(dbPath);
      _hotelsStore = StoreRef.main();
      return true;
    } catch (_) {
      throw DBConnectionException();
    }
  }

  @override
  Future<List<HotelItemDTO>> favouriteHotelItem(HotelItemDTO item) async {
    if (_database != null) {
      try {
        await _hotelsStore.record(item.hotelId ?? "").put(_database!, item.toJson());
        return await fetchFavouriteHotelsData();
      } catch (_) {
        throw DBConnectionException();
      }
    } else {
      throw DBConnectionException(statusMessage: AppLocalizations.of(Get.context!)!.dbNotInitialized);
    }
  }

  @override
  Future<void> unFavouriteAllHotelItems() async {
    try {
      final appDocumentDir = await getApplicationDocumentsDirectory();
      final dbPath = join(appDocumentDir.path, _kDbFileName);
      await databaseFactoryIo.deleteDatabase(dbPath);
    } catch (_) {
      throw DBConnectionException();
    }
  }

  @override
  Future<List<HotelItemDTO>> unFavouriteHotelItem(HotelItemDTO hotelItem) async {
    if (_database != null) {
      try {
        await _hotelsStore.record(hotelItem.hotelId ?? "").delete(_database!);
        return await fetchFavouriteHotelsData();
      } catch (_) {
        throw DBConnectionException();
      }
    } else {
      throw DBConnectionException(statusMessage: AppLocalizations.of(Get.context!)!.dbNotInitialized);
    }
  }

  @override
  Future<List<HotelItemDTO>> fetchFavouriteHotelsData() async {
    if (_database != null) {
      try {
        final recordSnapshots = await _hotelsStore.find(_database!);
        final response = recordSnapshots.map<HotelItemDTO>((e) => HotelItemDTO.fromJson(e.value)).toList(growable: false);
        return response;
      } catch (_) {
        throw DBConnectionException();
      }
    } else {
      throw DBConnectionException(statusMessage: AppLocalizations.of(Get.context!)!.dbNotInitialized);
    }
  }
}
