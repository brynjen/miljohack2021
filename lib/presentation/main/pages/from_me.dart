import 'package:flutter/material.dart';
import 'package:miljohack/presentation/main/widgets/package.dart';

class FromMe extends StatelessWidget {
  const FromMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      itemBuilder: (_, index) => Package(id: 'Fra meg', name: 'test $index'),
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemCount: 2,
    );
  }
}
