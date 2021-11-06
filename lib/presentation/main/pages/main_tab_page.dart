import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:miljohack/application/main/package_list/package_list_bloc.dart';
import 'package:miljohack/application/main/package_list/package_list_event.dart';
import 'package:miljohack/application/main/send_token/send_token.dart';
import 'package:miljohack/generated/l10n.dart';
import 'package:miljohack/infrastructure/network/api_client.dart';
import 'package:miljohack/presentation/core/theme/app_theme.dart';
import 'package:miljohack/presentation/main/pages/for_me.dart';
import 'package:miljohack/presentation/main/pages/from_me.dart';

class MainTabPage extends StatefulWidget {
  const MainTabPage({Key? key}) : super(key: key);

  @override
  _MainTabPAgeState createState() => _MainTabPAgeState();
}

class _MainTabPAgeState extends State<MainTabPage>
    with SingleTickerProviderStateMixin {
  final tabPages = const <Widget>[ForMe(), FromMe()];
  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
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
    );
  }

  Future<void> onRefresh() async {
    final apiClient = GetIt.instance.get<ApiClient>();
    final packages = await apiClient.loadPackages();
    BlocProvider.of<PackageListBloc>(context)
        .add(HackLoadedPackages(mailPackages: packages));
  }
}
