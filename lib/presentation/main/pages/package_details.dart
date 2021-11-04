import 'package:flutter/material.dart';
import 'package:miljohack/domain/main/data/mail_package.dart';
import 'package:miljohack/presentation/core/theme/app_theme.dart';
import 'package:miljohack/presentation/environment_details/widgets/environment_savings_card.dart';
import 'package:miljohack/presentation/main/widgets/augmented_reality_card.dart';
import 'package:miljohack/presentation/main/widgets/mail_avatar.dart';
import 'package:miljohack/presentation/main/widgets/options_card.dart';

class PackageDetails extends StatelessWidget {
  const PackageDetails({required this.mailPackage, Key? key}) : super(key: key);
  final MailPackage mailPackage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detaljer på pakken'),
      ),
      body: Container(
        color: AppColors.greyBg,
        child: ListView(
          children: [
            Container(
              color: AppColors.white,
              child: ListTile(
                title: Text(mailPackage.shopName, style: TS.bold),
                subtitle: Text('Frakt er bestilt', style: TS.body),
                trailing: const MailAvatar(),
              ),
            ),
            const SizedBox(height: 10),
            EnvironmentSavingsCard(mailPackage: mailPackage),
            const SizedBox(height: 10),
            OptionsCard(),
            const SizedBox(height: 10),
            AugmentedRealityCard(),
          ],
        ),
      ),
    );
  }
}
