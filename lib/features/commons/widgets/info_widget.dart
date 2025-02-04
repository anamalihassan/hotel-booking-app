import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_fonts.dart';

class InfoWidget extends StatelessWidget {
  final String title;
  final String? message;

  const InfoWidget({super.key, required this.title, this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: AppFonts.subHeaderSize,
              color: AppColors.primary,
            ),
          ),
          if (message != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Text(
                message!,
                style: const TextStyle(
                  fontSize: AppFonts.bodySize,
                  color: AppColors.black,
                ),
              ),
            )
        ],
      ),
    );
  }
}
