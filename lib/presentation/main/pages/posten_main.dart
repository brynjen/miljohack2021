import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:miljohack/generated/l10n.dart';
import 'package:miljohack/infrastructure/network/api_client.dart';
import 'package:miljohack/presentation/core/icons/miljo_hack_icons.dart';
import 'package:miljohack/presentation/main/pages/main_tab_page.dart';
import 'package:miljohack/presentation/profile/pages/profile_page.dart';

/// Main page containing the flow when user enters into the app
class PostenMain extends StatefulWidget {
  const PostenMain({Key? key}) : super(key: key);

  @override
  State<PostenMain> createState() => _PostenMainState();
}

class _PostenMainState extends State<PostenMain> with TickerProviderStateMixin {
  final apiClient = GetIt.instance.get<ApiClient>();
  final bottomTabPages = const <Widget>[
    MainTabPage(),
    ProfilePage(),
    ProfilePage()
  ];
  var _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      //log('Firebase message received: ${message.notification?.title} - ${message.notification?.body}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bottomTabPages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: const Icon(MiljoHack.package),
              label: S.of(context).my_packages),
          BottomNavigationBarItem(
              icon: const Icon(MiljoHack.send), label: S.of(context).send),
          BottomNavigationBarItem(
              icon: const Icon(MiljoHack.account_circle),
              label: S.of(context).profile)
        ],
      ),
    );
  }
}
