import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:miljohack/presentation/core/app_theme.dart';

class MailAvatar extends StatelessWidget {
  const MailAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      child: Icon(
        CommunityMaterialIcons.package_variant_closed,
        color: AppColors.darkRed,
      ),
      backgroundColor: AppColors.lightRed,
    );
  }
}
