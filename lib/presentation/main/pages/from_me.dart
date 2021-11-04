import 'package:flutter/material.dart';

class FromMe extends StatefulWidget {
  const FromMe({Key? key}) : super(key: key);

  @override
  State<FromMe> createState() => _FromMeState();
}

class _FromMeState extends State<FromMe> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Du sender ingen pakker'),
    );
  }
}
