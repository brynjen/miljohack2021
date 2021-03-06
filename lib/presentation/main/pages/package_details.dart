import 'package:flutter/material.dart';
import 'package:miljohack/domain/main/data/mail_package.dart';
import 'package:miljohack/generated/l10n.dart';
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
        title: Text(S.of(context).package_details),
      ),
      body: Container(
        color: Theme.of(context).backgroundColor,
        child: ListView(
          children: [
            Container(
              color: Theme.of(context).cardTheme.color,
              child: ListTile(
                title: Text(mailPackage.shopName, style: TS.of(context).bold),
                subtitle: Text(S.of(context).package_ordered,
                    style: TS.of(context).body),
                trailing: const MailAvatar(),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  EnvironmentSavingsCard(mailPackage: mailPackage),
                  const SizedBox(height: 10),
                  const OptionsCard(),
                  const SizedBox(height: 10),
                  const AugmentedRealityCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
