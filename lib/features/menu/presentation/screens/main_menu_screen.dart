import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/core/constants/app_icons.dart';
import 'package:hotel_booking/features/account/presentation/screens/account_screen.dart';
import 'package:hotel_booking/features/home/presentation/screens/home_screen.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_fonts.dart';
import '../../../../core/theme/custom_theme.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../favourites/presentaiton/screens/favourites_screen.dart';
import '../../../search/presentation/screens/search_screen.dart';
import '../../data/models/menu_item.dart';

class MainMenuScreen extends StatefulWidget {
  const MainMenuScreen({super.key});

  @override
  State<MainMenuScreen> createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
  final _currentIndex = 0.obs;
  final List<MenuItem> _menuItems = [
    MenuItem(title: AppLocalizations.of(Get.context!)!.home, icon: menuIconHome),
    MenuItem(title: AppLocalizations.of(Get.context!)!.search, icon: menuIconSearch),
    MenuItem(title: AppLocalizations.of(Get.context!)!.favourite, icon: menuIconFavourite),
    MenuItem(title: AppLocalizations.of(Get.context!)!.account, icon: menuIconAccount),
  ];

  List<BottomNavigationBarItem> _buildBottomMenuItems(bool isDarkMode) {
    List<BottomNavigationBarItem> items = [];
    for (MenuItem item in _menuItems) {
      items.add(BottomNavigationBarItem(
        icon: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: SvgPicture.asset(
            item.icon,
            height: 24,
            colorFilter: ColorFilter.mode(
              Theme.of(context).extension<CustomAppTheme>()?.secondaryColor ?? AppColors.menuItemColorUnselected,
              BlendMode.srcIn,
            ),
          ),
        ),
        label: item.title,
        activeIcon: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: SvgPicture.asset(
            item.icon,
            height: 24,
            colorFilter: ColorFilter.mode(
              Theme.of(context).extension<CustomAppTheme>()?.accent ?? AppColors.menuItemColorSelected,
              BlendMode.srcIn,
            ),
          ),
        ),
      ));
    }
    return items;
  }

  buildBottomNavigationMenu(context, bool isDarkMode) {
    final customTheme = Theme.of(context).extension<CustomAppTheme>();
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        setState(() {
          _currentIndex.value = index;
        });
      },
      currentIndex: _currentIndex.value,
      items: _buildBottomMenuItems(isDarkMode),
      selectedLabelStyle: TextStyle(
        fontSize: AppFonts.captionSize,
        fontWeight: FontWeight.w400,
        color: customTheme?.accent,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: AppFonts.captionSize,
        fontWeight: FontWeight.w400,
        color: customTheme?.secondaryColor,
      ),
      selectedItemColor: customTheme?.accent,
      unselectedItemColor: customTheme?.secondaryColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _menuItems[_currentIndex.value].title == AppLocalizations.of(context)!.search ? AppLocalizations.of(context)!.hotels : _menuItems[_currentIndex.value].title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: AppFonts.subHeaderSize,
          ),
        ),
      ),
      bottomNavigationBar: buildBottomNavigationMenu(context, isDarkMode),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Obx(
              () => IndexedStack(
                index: _currentIndex.value,
                children: const [
                  HomeScreen(),
                  SearchScreen(),
                  FavouritesScreen(),
                  AccountScreen(),
                ],
              ),
            ),
          ),
          const Divider(
            color: Colors.black54,
            height: 1,
          )
        ],
      ),
    );
  }
}
