import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:miljohack/domain/main/data/mail_package.dart';
import 'package:miljohack/presentation/core/app_theme.dart';

class PackageCard extends StatelessWidget {
  const PackageCard(
      {required this.mailPackage, required this.onClick, Key? key})
      : super(key: key);

  final MailPackage mailPackage;
  final Function() onClick;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      child: InkWell(
        onTap: onClick,
        borderRadius: BorderRadius.circular(4),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(mailPackage.shopName,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.w900)),
            subtitle: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Text(
                  mailPackage.delivery,
                  style: const TextStyle(fontSize: 12, color: Colors.black),
                ),
                Text(mailPackage.time,
                    style: const TextStyle(fontSize: 14, color: Colors.black)),
              ],
            ),
            trailing: CircleAvatar(
              child: Icon(
                CommunityMaterialIcons.package_variant_closed,
                color: AppTheme.darkRed,
              ),
              backgroundColor: AppTheme.lightRed,
            ),
          ),
        ),
      ),
    );
  }
}
