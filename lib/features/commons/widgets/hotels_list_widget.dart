import 'package:flutter/material.dart';
import 'package:hotel_booking/features/home/data/models/hotel_item_dto.dart';

import '../../../../l10n/app_localizations.dart';
import 'hotel_item_widget.dart';
import 'info_widget.dart';

class HotelsListWidget extends StatelessWidget {
  final List<HotelItemDTO> hotels;
  final List<HotelItemDTO> favouriteHotels;
  final bool isFavouritesListWidget;
  final ScrollPhysics? physics;

  const HotelsListWidget({
    super.key,
    required this.hotels,
    this.favouriteHotels = const [],
    this.isFavouritesListWidget = false,
    this.physics,
  });

  @override
  Widget build(BuildContext context) {
    if (hotels.isEmpty) {
      return InfoWidget(title: AppLocalizations.of(context)!.noDataFound);
    }
    return ListView.builder(
      shrinkWrap: true,
      //+1 for progressbar
      padding: EdgeInsets.zero,
      physics: physics,
      itemCount: hotels.length,
      itemBuilder: (BuildContext context, int index) {
        HotelItemDTO hotelItemDTO = hotels[index];
        bool isHotelAddedToFavourites = isFavouritesListWidget ? true : favouriteHotels.where((it) => it.hotelId == hotelItemDTO.hotelId).isNotEmpty;
        return InkWell(
          onTap: () {},
          child: HotelItemWidget(
            hotelItemDTO: hotelItemDTO,
            isHotelAddedToFavourites: isHotelAddedToFavourites,
            isFavouritesListWidget: isFavouritesListWidget,
          ),
        );
      },
    );
  }
}
