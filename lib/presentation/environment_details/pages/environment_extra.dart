import 'package:flutter/material.dart';
import 'package:miljohack/generated/l10n.dart';

class EnvironmentExtra extends StatelessWidget {
  const EnvironmentExtra({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).environment_stuff_title),
      ),
      body: Center(
        child: Text(S.of(context).environment_stuff_message),
      ),
    );
  }
}
