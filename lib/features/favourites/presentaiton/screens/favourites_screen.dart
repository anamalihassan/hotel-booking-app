import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking/features/commons/widgets/hotels_list_widget.dart';
import 'package:hotel_booking/features/favourites/bloc/favourites_event.dart';
import 'package:hotel_booking/features/home/data/models/hotel_item_dto.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../commons/widgets/info_widget.dart';
import '../../bloc/favourites_bloc.dart';
import '../../bloc/favourites_state.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({super.key});

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  List<HotelItemDTO> hotels = [];

  void fetchData() async {
    context.read<FavouritesBloc>().add(FetchFavouriteHotelsDataEvent());
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBlocWidget(),
    );
  }

  Widget _buildBlocWidget() {
    return BlocListener<FavouritesBloc, FavouritesState>(
      listener: (context, state) {},
      child: BlocBuilder<FavouritesBloc, FavouritesState>(
        builder: (context, state) {
          if (state is FavouriteHotelsDataSuccess) {
            hotels = state.hotels;
          } else if (state is FavouriteHotelsFailure) {
            return InfoWidget(
              title: AppLocalizations.of(context)!.failureTitle,
              message: state.dbConnectionException.statusMessage ?? AppLocalizations.of(context)!.tryAgainMessage,
            );
          } else if (state is FavouriteHotelsDataLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return HotelsListWidget(
            hotels: hotels,
            isFavouritesListWidget: true,
          );
        },
      ),
    );
  }
}
