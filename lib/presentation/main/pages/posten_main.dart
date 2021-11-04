import 'package:community_material_icon/community_material_icon.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

/// Main page containing the flow when user enters into the app
class PostenMain extends StatelessWidget {
  const PostenMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mine pakker'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
      ),
      body: ListView(
        children: [
          ElevatedButton(
              onPressed: () {
                FirebaseCrashlytics.instance
                    .recordError(ArgumentError('Shit gone rogue'), null);
              },
              child: const Text('Click me'))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(CommunityMaterialIcons.package), label: 'Profil'),
          BottomNavigationBarItem(icon: Icon(Icons.send), label: 'Sende'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'Profil')
        ],
      ),
    );
  }
}
