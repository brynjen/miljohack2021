import 'dart:async';
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:miljohack/presentation/main/pages/posten_main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runZonedGuarded(() async {
    try {
      await Firebase.initializeApp();
    } catch (e) {
      log('Failed firebase:$e');
    }
    runApp(const Miljohack2021());
  }, (error, stackTrace) {});
}

class Miljohack2021 extends StatelessWidget {
  const Miljohack2021({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Miljøhack 2021 - Posten',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PostenMain(),
    );
  }
}
