import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_booking/core/constants/app_fonts.dart';
import 'package:hotel_booking/features/commons/widgets/app_primary_button.dart';
import 'package:hotel_booking/features/commons/widgets/network_image_widget.dart';
import 'package:hotel_booking/features/favourites/bloc/favourites_event.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_icons.dart';
import '../../../core/helpers/currency_utility.dart';
import '../../../core/theme/custom_theme.dart';
import '../../../l10n/app_localizations.dart';
import '../../favourites/bloc/favourites_bloc.dart';
import '../../home/data/models/hotel_item_dto.dart';

class HotelItemWidget extends StatelessWidget {
  final HotelItemDTO hotelItemDTO;
  final bool isHotelAddedToFavourites;
  final bool isFavouritesListWidget;

  const HotelItemWidget({
    super.key,
    required this.hotelItemDTO,
    this.isHotelAddedToFavourites = false,
    this.isFavouritesListWidget = false,
  });

  void favouriteHotel(BuildContext context) async {
    context.read<FavouritesBloc>().add(isHotelAddedToFavourites ? UnFavouriteHotelEvent(hotelItemDTO: hotelItemDTO) : FavouriteHotelEvent(hotelItemDTO: hotelItemDTO));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6.0),
        child: Container(
          color: Theme.of(context).cardColor,
          child: Column(
            children: [
              _buildThumbnailSection(context),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    _buildTitleSectionWidget(context),
                    const Divider(
                      color: Colors.black54,
                      height: 1,
                    ),
                    if (!isFavouritesListWidget) _buildBestOfferResultWidget(context),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: AppPrimaryButton(
                        title: isFavouritesListWidget ? AppLocalizations.of(context)!.toHotel : AppLocalizations.of(context)!.toTheOffers,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildThumbnailSection(BuildContext context) {
    double height = (MediaQuery.of(context).size.width - 32) * 0.583;
    String imageUrl = "";
    if (hotelItemDTO.images?.isNotEmpty ?? false) {
      imageUrl = hotelItemDTO.images?[0].large ?? hotelItemDTO.images?[0].small ?? "";
    }
    return Stack(
      children: [
        NetworkImageWidget(
          imageUrl: imageUrl,
          width: double.infinity,
          height: height,
        ),
        Positioned(
          top: 11,
          right: 17,
          child: IconButton(
            onPressed: () async {
              favouriteHotel(context);
            },
            icon: Icon(
              isHotelAddedToFavourites ? Icons.favorite : Icons.favorite_outline,
              color: AppColors.white,
              size: 32,
            ),
          ),
        ),
        if (isFavouritesListWidget)
          Positioned(
            bottom: 11,
            left: 17,
            child: Row(
              children: [
                Container(
                  color: Theme.of(context).extension<CustomAppTheme>()?.ratingBackgroundColor,
                  padding: const EdgeInsets.all(4.0),
                  margin: const EdgeInsets.only(right: 4.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 4.0),
                        child: SvgPicture.asset(
                          icMood,
                          height: 12.0,
                        ),
                      ),
                      Text(
                        "${hotelItemDTO.ratingInfo?.score ?? ""} / 5.0",
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: AppFonts.captionSize,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  hotelItemDTO.ratingInfo?.scoreDescription ?? "",
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: AppFonts.captionSize,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildTitleSectionWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        children: [
          Row(
            children: [
              RatingBar.readOnly(
                filledIcon: Icons.star,
                emptyIcon: Icons.star_border,
                emptyColor: Theme.of(context).primaryColor,
                filledColor: Theme.of(context).primaryColor,
                initialRating: hotelItemDTO.category ?? 0,
                maxRating: 5,
                size: 18,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: SvgPicture.asset(
                  icHelpOutline,
                  height: 16.0,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).primaryColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.only(top: 4.0, bottom: 2.0),
            width: double.infinity,
            child: Text(
              hotelItemDTO.name ?? "",
              style: TextStyle(
                fontSize: AppFonts.subHeaderSize,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).textTheme.displayLarge?.color,
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Text(
              hotelItemDTO.destination ?? "",
              style: TextStyle(
                fontSize: AppFonts.bodySize,
                fontWeight: FontWeight.w400,
                color: Theme.of(context).textTheme.displayMedium?.color,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBestOfferResultWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildInfoRow(
                context,
                "${hotelItemDTO.bestOffer?.travelDate?.days ?? 0} ${AppLocalizations.of(context)!.days}",
                "${hotelItemDTO.bestOffer?.travelDate?.nights ?? 0} ${AppLocalizations.of(context)!.nights}",
              ),
              _buildInfoRow(
                context,
                hotelItemDTO.bestOffer?.rooms?.overall?.name ?? "",
                hotelItemDTO.bestOffer?.rooms?.overall?.boarding ?? "",
              ),
              _buildInfoRow(
                context,
                "${hotelItemDTO.bestOffer?.rooms?.overall?.adultCount ?? 0} ${AppLocalizations.of(context)!.adults}, ${hotelItemDTO.bestOffer?.rooms?.overall?.childrenCount ?? 0} ${AppLocalizations.of(context)!.children}",
                AppLocalizations.of(context)!.includingBreakfast,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "${AppLocalizations.of(context)!.from}  ",
                    style: TextStyle(
                      fontSize: AppFonts.captionSize,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).textTheme.displayLarge?.color,
                    ),
                  ),
                  Text(
                    CurrencyUtility.getFormatter().format(hotelItemDTO.bestOffer?.total ?? 0),
                    style: TextStyle(
                      fontSize: AppFonts.titleSize,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).textTheme.displayLarge?.color,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 2.0),
                child: Text(
                  "${CurrencyUtility.getFormatter().format(hotelItemDTO.bestOffer?.simplePricePerPerson ?? 0)} p.P.",
                  style: TextStyle(
                    fontSize: AppFonts.captionSize,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).textTheme.displayMedium?.color,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, String firstInfo, String secondInfo) {
    return SizedBox(
      width: 185,
      child: Wrap(
        children: [
          Text(
            firstInfo,
            style: TextStyle(
              fontSize: AppFonts.captionSize,
              fontWeight: FontWeight.w400,
              color: Theme.of(context).textTheme.displayMedium?.color,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 4.5,
            ),
            height: 16,
            child: const VerticalDivider(
              color: Colors.black87,
              width: 1,
            ),
          ),
          Text(
            secondInfo,
            style: TextStyle(
              fontSize: AppFonts.captionSize,
              fontWeight: FontWeight.w400,
              color: Theme.of(context).textTheme.displayMedium?.color,
            ),
          ),
        ],
      ),
    );
  }
}
