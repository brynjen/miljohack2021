import 'package:flutter/material.dart';
import 'package:miljohack/presentation/core/icons/miljo_hack_icons.dart';
import 'package:miljohack/presentation/core/theme/app_theme.dart';

class DollarContainer extends StatelessWidget {
  const DollarContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
          color: AppColors.grey[500],
          border: Border.all(color: AppColors.red[700]!, width: 3)),
      child: Center(
          child: Icon(
        MiljoHack.dollar_sign,
        color: AppColors.red[600],
      )),
    );
  }
}
