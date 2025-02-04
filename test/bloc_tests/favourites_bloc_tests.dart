import 'package:bloc_test/bloc_test.dart';
import 'package:hotel_booking/core/exception/db_connection_exception.dart';
import 'package:hotel_booking/features/favourites/bloc/favourites_bloc.dart';
import 'package:hotel_booking/features/favourites/bloc/favourites_event.dart';
import 'package:hotel_booking/features/favourites/bloc/favourites_state.dart';
import 'package:hotel_booking/features/favourites/data/repository/favourites_repository.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../mocks/mock_hotels_response.dart';

class MockFavouritesRepository extends Mock implements FavouritesRepository {}

void main() {
  group('Favourites Bloc Tests', () {
    late MockFavouritesRepository mockFavouritesRepository;

    setUp(() {
      mockFavouritesRepository = MockFavouritesRepository();
    });

    blocTest<FavouritesBloc, FavouritesState>(
      'Fetch Favourite Hotels Data Test When Success',
      setUp: () => when(mockFavouritesRepository.fetchFavouriteHotelsData).thenAnswer((_) async => hotelsResponse.hotels ?? []),
      build: () => FavouritesBloc(repository: mockFavouritesRepository),
      act: (bloc) => bloc.add(FetchFavouriteHotelsDataEvent()),
      expect: () => [FavouriteHotelsDataLoading(), FavouriteHotelsDataSuccess(hotels: hotelsResponse.hotels ?? [])],
      verify: (_) => verify(mockFavouritesRepository.fetchFavouriteHotelsData).called(1),
    );

    blocTest<FavouritesBloc, FavouritesState>(
      'Fetch Favourite Hotels Data Test When Failure',
      setUp: () => when(mockFavouritesRepository.fetchFavouriteHotelsData).thenThrow(DBConnectionException()),
      build: () => FavouritesBloc(repository: mockFavouritesRepository),
      act: (bloc) => bloc.add(FetchFavouriteHotelsDataEvent()),
      expect: () => [FavouriteHotelsDataLoading(), isA<FavouriteHotelsFailure>()],
      verify: (_) => verify(mockFavouritesRepository.fetchFavouriteHotelsData).called(1),
    );

    blocTest<FavouritesBloc, FavouritesState>(
      'Favourite a Hotel Test When Success',
      setUp: () => when(() => mockFavouritesRepository.favouriteHotelItem(hotelsResponse.hotels![0])).thenAnswer((_) async => hotelsResponse.hotels ?? []),
      build: () => FavouritesBloc(repository: mockFavouritesRepository),
      act: (bloc) => bloc.add(FavouriteHotelEvent(hotelItemDTO: hotelsResponse.hotels![0])),
      expect: () => [FavouriteHotelLoading(), FavouriteHotelsDataSuccess(hotels: hotelsResponse.hotels ?? [])],
      verify: (_) => verify(() => mockFavouritesRepository.favouriteHotelItem(hotelsResponse.hotels![0])).called(1),
    );

    blocTest<FavouritesBloc, FavouritesState>(
      'Favourite a Hotel Test When Failure',
      setUp: () => when(() => mockFavouritesRepository.favouriteHotelItem(hotelsResponse.hotels![0])).thenThrow(DBConnectionException()),
      build: () => FavouritesBloc(repository: mockFavouritesRepository),
      act: (bloc) => bloc.add(FavouriteHotelEvent(hotelItemDTO: hotelsResponse.hotels![0])),
      expect: () => [FavouriteHotelLoading(), isA<FavouriteHotelsFailure>()],
      verify: (_) => verify(() => mockFavouritesRepository.favouriteHotelItem(hotelsResponse.hotels![0])).called(1),
    );

    blocTest<FavouritesBloc, FavouritesState>(
      'UnFavourite a Hotel Test When Success',
      setUp: () => when(() => mockFavouritesRepository.unFavouriteHotelItem(hotelsResponse.hotels![0])).thenAnswer((_) async => hotelsResponse.hotels ?? []),
      build: () => FavouritesBloc(repository: mockFavouritesRepository),
      act: (bloc) => bloc.add(UnFavouriteHotelEvent(hotelItemDTO: hotelsResponse.hotels![0])),
      expect: () => [UnFavouriteHotelLoading(), FavouriteHotelsDataSuccess(hotels: hotelsResponse.hotels ?? [])],
      verify: (_) => verify(() => mockFavouritesRepository.unFavouriteHotelItem(hotelsResponse.hotels![0])).called(1),
    );

    blocTest<FavouritesBloc, FavouritesState>(
      'UnFavourite a Hotel Test When Failure',
      setUp: () => when(() => mockFavouritesRepository.unFavouriteHotelItem(hotelsResponse.hotels![0])).thenThrow(DBConnectionException()),
      build: () => FavouritesBloc(repository: mockFavouritesRepository),
      act: (bloc) => bloc.add(UnFavouriteHotelEvent(hotelItemDTO: hotelsResponse.hotels![0])),
      expect: () => [UnFavouriteHotelLoading(), isA<FavouriteHotelsFailure>()],
      verify: (_) => verify(() => mockFavouritesRepository.unFavouriteHotelItem(hotelsResponse.hotels![0])).called(1),
    );
  });
}
