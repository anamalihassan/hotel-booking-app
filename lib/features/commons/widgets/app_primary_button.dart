import 'package:flutter/material.dart';

import '../../../core/constants/app_fonts.dart';
import '../../../core/theme/custom_theme.dart';

class AppPrimaryButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;

  const AppPrimaryButton({super.key, required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          disabledForegroundColor: Colors.white,
          disabledBackgroundColor: Theme.of(context).extension<CustomAppTheme>()?.buttonOrangeColor,
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: AppFonts.subHeaderSize,
          ),
        ),
      ),
    );
  }
}
