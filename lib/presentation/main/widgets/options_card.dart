import 'package:flutter/material.dart';
import 'package:miljohack/presentation/core/theme/app_theme.dart';

class OptionsCard extends StatelessWidget {
  const OptionsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
    );
  }
}
