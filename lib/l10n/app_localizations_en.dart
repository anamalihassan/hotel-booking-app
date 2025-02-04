import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get home => 'Overview';

  @override
  String get search => 'Search';

  @override
  String get favourite => 'Favourite';

  @override
  String get account => 'Account';

  @override
  String get toTheOffers => 'View Offers';

  @override
  String get toHotel => 'View Hotel';

  @override
  String get nights => 'Nights';

  @override
  String get hotels => 'Hotels';

  @override
  String get hotelsFor => 'Hotels for';

  @override
  String get days => 'Days';

  @override
  String get adults => 'Adults';

  @override
  String get children => 'Children';

  @override
  String get includingBreakfast => 'incl. Breakfast';

  @override
  String get from => 'From';

  @override
  String get failureTitle => 'Something went wrong';

  @override
  String get tryAgainMessage => 'Please try again.';

  @override
  String get noDataFound => 'No data found.';

  @override
  String get dbNotInitialized => 'DB is not initialized.';
}
