import 'package:flutter/material.dart';
import 'package:hotel_booking/l10n/app_localizations.dart';

import '../../../../core/constants/app_fonts.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppLocalizations.of(context)!.account,
            style: TextStyle(
              fontSize: AppFonts.subHeaderSize,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
