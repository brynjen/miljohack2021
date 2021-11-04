import 'package:flutter/material.dart';
import 'package:miljohack/presentation/main/widgets/package.dart';

class ForMe extends StatelessWidget {
  const ForMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        itemBuilder: (_, index) => Package(id: 'For meg', name: 'test $index'),
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemCount: 10,
      ),
    );
  }
}
