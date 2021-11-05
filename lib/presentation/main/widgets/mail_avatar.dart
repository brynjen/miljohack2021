import 'package:flutter/material.dart';
import 'package:miljohack/presentation/core/icons/miljo_hack_icons.dart';
import 'package:miljohack/presentation/core/theme/app_theme.dart';

class MailAvatar extends StatelessWidget {
  const MailAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      child: Icon(MiljoHack.package, color: AppColors.red[600]!),
      backgroundColor: AppColors.red[200]!,
    );
  }
}
