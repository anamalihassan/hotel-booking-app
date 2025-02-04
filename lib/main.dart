import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hotel_booking/features/favourites/bloc/favourites_bloc.dart';
import 'package:hotel_booking/features/home/bloc/home_bloc.dart';
import 'package:hotel_booking/routes/app_router.dart';
import 'package:hotel_booking/routes/app_routes.dart';

import 'core/di/injector.dart';
import 'core/theme/dark_theme.dart';
import 'core/theme/light_theme.dart';
import 'l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(create: (context) {
          return injector<HomeBloc>();
        }),
        BlocProvider<FavouritesBloc>(create: (context) {
          return injector<FavouritesBloc>();
        }),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        title: 'Hotel Booking',
        theme: lightTheme,
        darkTheme: darkTheme,
        onGenerateRoute: AppRouter.generateRoute,
        initialRoute: AppRoutes.mainScreen,
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
            child: child!,
          );
        },
      ),
    );
  }
}
