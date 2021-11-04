import 'package:flutter/material.dart';
import 'package:miljohack/domain/main/data/mail_package.dart';
import 'package:miljohack/presentation/core/theme/app_theme.dart';
import 'package:miljohack/presentation/main/widgets/mail_avatar.dart';

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
            title: Text(mailPackage.shopName, style: TS.bold),
            subtitle: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Text(
                  '${mailPackage.message} - ${mailPackage.deliveryDate}',
                  style: TS.body,
                ),
                Text(mailPackage.deliveryTime, style: TS.body2),
              ],
            ),
            trailing: const MailAvatar(),
          ),
        ),
      ),
    );
  }
}
