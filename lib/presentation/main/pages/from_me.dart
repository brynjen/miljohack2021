import 'package:flutter/material.dart';
import 'package:miljohack/domain/main/data/mail_package.dart';
import 'package:miljohack/presentation/main/pages/package_details.dart';
import 'package:miljohack/presentation/main/widgets/package_card.dart';

class FromMe extends StatefulWidget {
  const FromMe({Key? key}) : super(key: key);

  @override
  State<FromMe> createState() => _FromMeState();
}

class _FromMeState extends State<FromMe> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      itemBuilder: (_, index) {
        final package = MailPackage(
            id: '$index',
            delivery: 'test',
            shopName: 'Komplett',
            time: '11:00');
        return PackageCard(
          mailPackage: package,
          onClick: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => PackageDetails(mailPackage: package)));
          },
        );
      },
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemCount: 10,
    );
  }
}
