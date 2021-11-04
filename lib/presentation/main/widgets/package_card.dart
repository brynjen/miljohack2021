import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:miljohack/domain/main/data/mail_package.dart';

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
          child: Row(
            children: [
              const Icon(CommunityMaterialIcons.package_variant_closed),
              Expanded(
                child: ListTile(
                  title: Text(mailPackage.shopName,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  subtitle: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        mailPackage.delivery,
                        style: const TextStyle(fontSize: 10),
                      ),
                      Text(mailPackage.time,
                          style: const TextStyle(fontSize: 11)),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
