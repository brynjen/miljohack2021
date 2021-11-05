import 'package:flutter/material.dart';
import 'package:miljohack/generated/l10n.dart';

class FromMe extends StatefulWidget {
  const FromMe({Key? key}) : super(key: key);

  @override
  State<FromMe> createState() => _FromMeState();
}

class _FromMeState extends State<FromMe> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(S.of(context).you_are_not_sending),
    );
  }
}
