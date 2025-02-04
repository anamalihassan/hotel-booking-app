import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking/features/favourites/bloc/favourites_state.dart';
import 'package:hotel_booking/features/home/bloc/home_bloc.dart';
import 'package:hotel_booking/features/home/bloc/home_event.dart';
import 'package:hotel_booking/features/home/bloc/home_state.dart';
import 'package:hotel_booking/features/home/data/models/hotel_item_dto.dart';
import 'package:hotel_booking/features/home/data/models/hotels_response.dart';

import '../../../../core/constants/app_fonts.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../commons/widgets/hotels_list_widget.dart';
import '../../../commons/widgets/info_widget.dart';
import '../../../favourites/bloc/favourites_bloc.dart';
import '../../../favourites/bloc/favourites_event.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  HotelsResponse? hotelsResponse;
  List<HotelItemDTO> favouriteHotels = [];

  void fetchData() async {
    context.read<HomeBloc>().add(FetchHotelsDataEvent());
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
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {},
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HotelsDataSuccess) {
            hotelsResponse = state.hotelsResponse;
          } else if (state is HotelsDataFailure) {
            return InfoWidget(
              title: AppLocalizations.of(context)!.failureTitle,
              message: state.networkException.statusMessage ?? AppLocalizations.of(context)!.tryAgainMessage,
            );
          } else if (state is HotelsDataLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return BlocBuilder<FavouritesBloc, FavouritesState>(
            builder: (context, state) {
              if (state is FavouriteHotelsDataSuccess) {
                favouriteHotels = state.hotels;
              }
              return _buildHotelsListWidget();
            },
          );
        },
      ),
    );
  }

  Widget _buildHotelsListWidget() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 24.0),
            child: Text(
              "${hotelsResponse?.hotelCount ?? 0} ${AppLocalizations.of(context)!.hotelsFor} ${hotelsResponse?.usedSearchRequest?.destination}.",
              style: TextStyle(
                fontSize: AppFonts.subTitleSize,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).textTheme.displayLarge?.color,
              ),
            ),
          ),
          HotelsListWidget(
            hotels: hotelsResponse?.hotels ?? [],
            favouriteHotels: favouriteHotels,
            physics: const NeverScrollableScrollPhysics(),
          ),
        ],
      ),
    );
  }
}
