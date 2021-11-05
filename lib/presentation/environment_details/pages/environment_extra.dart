import 'package:flutter/material.dart';

class EnvironmentExtra extends StatelessWidget {
  const EnvironmentExtra({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Miljø stuff'),
      ),
      body: Center(
        child: Text('Her er masse nyttig om miljø ting'),
      ),
    );
  }
}
