import 'package:flutter/material.dart';
import 'package:miljohack/domain/main/data/mail_package.dart';

class PackageDetails extends StatelessWidget {
  const PackageDetails({required this.mailPackage, Key? key}) : super(key: key);
  final MailPackage mailPackage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detaljer på pakken'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        children: const [Text('Her kommer detaljer')],
      ),
    );
  }
}
