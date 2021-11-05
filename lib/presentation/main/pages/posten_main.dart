import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:miljohack/application/main/package_list/package_list.dart';
import 'package:miljohack/application/main/send_token/send_token.dart';
import 'package:miljohack/generated/l10n.dart';
import 'package:miljohack/infrastructure/network/api_client.dart';
import 'package:miljohack/presentation/core/icons/miljo_hack_icons.dart';
import 'package:miljohack/presentation/core/theme/app_theme.dart';
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
      //log('Firebase message received: ${message.notification?.title} - ${message.notification?.body}');
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
        elevation: 0,
        title: Text(S.of(context).my_packages),
        actions: [
          IconButton(
              onPressed: () async {
                final String? token =
                    await FirebaseMessaging.instance.getToken();

                if (token != null) {
                  BlocProvider.of<SendtokenBloc>(context)
                      .add(SendToken(firebaseToken: token));
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
          indicatorColor: AppColors.white,
          controller: tabController,
          onTap: (index) {
            setState(() {
              tabController.index = index;
            });
          },
          tabs: [
            Tab(text: S.of(context).to_me),
            Tab(text: S.of(context).from_me)
          ],
        ),
      ),
      body: RefreshIndicator(
        onRefresh: onRefresh,
        child: tabPages[tabController.index],
      ),
      bottomNavigationBar: BottomNavigationBar(
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

  Future<void> onRefresh() async {
    final apiClient = GetIt.instance.get<ApiClient>();
    final packages = await apiClient.loadPackages();
    BlocProvider.of<PackageListBloc>(context)
        .add(HackLoadedPackages(mailPackages: packages));
  }
}
