import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:miljohack/application/main/package_list/package_list.dart';
import 'package:miljohack/infrastructure/network/api_client.dart';
import 'package:miljohack/presentation/core/icons/miljo_hack_icons.dart';
import 'package:miljohack/presentation/main/pages/for_me.dart';
import 'package:miljohack/presentation/main/pages/from_me.dart';

/// Main page containing the flow when user enters into the app
class PostenMain extends StatefulWidget {
  const PostenMain({Key? key}) : super(key: key);

  @override
  State<PostenMain> createState() => _PostenMainState();
}

class _PostenMainState extends State<PostenMain> with TickerProviderStateMixin {
  final apiClient = GetIt.instance.get<ApiClient>();
  late final TabController tabController;
  final tabPages = const <Widget>[ForMe(), FromMe()];

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 2, vsync: this);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      log('Firebase message received: ${message.notification?.title} - ${message.notification?.body}');
    });
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mine pakker'),
        actions: [
          IconButton(
              onPressed: () async {
                final String? token =
                    await FirebaseMessaging.instance.getToken();
                if (token != null) {
                  apiClient.sendToken(token: token);
                  const snackBar = SnackBar(content: Text('Token sendt'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                } else {
                  const snackBar = SnackBar(content: Text('Token ikke sendt'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              icon: const Icon(Icons.add))
        ],
        bottom: TabBar(
          controller: tabController,
          onTap: (index) {
            setState(() {
              tabController.index = index;
            });
          },
          tabs: const [Tab(text: 'TIL MEG'), Tab(text: 'FRA MEG')],
        ),
      ),
      body: RefreshIndicator(
        onRefresh: onRefresh,
        child: tabPages[tabController.index],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(MiljoHack.package), label: 'Mine pakker'),
          BottomNavigationBarItem(icon: Icon(MiljoHack.send), label: 'Sende'),
          BottomNavigationBarItem(
              icon: Icon(MiljoHack.account_circle), label: 'Profil')
        ],
      ),
    );
  }

  Future<void> onRefresh() async {
    final apiClient = GetIt.instance.get<ApiClient>();
    final packages = await apiClient.loadPackages();
    BlocProvider.of<PackageListBloc>(context)
        .add(HackLoadedPackages(mailPackages: packages));
  }
}
