import 'package:flutter/material.dart';
import 'package:miljohack/generated/l10n.dart';
import 'package:miljohack/presentation/core/icons/miljo_hack_icons.dart';
import 'package:miljohack/presentation/core/theme/app_theme.dart';
import 'package:miljohack/presentation/environment_details/pages/leaderboard_page.dart';
import 'package:miljohack/presentation/profile/widgets/profile_description.dart';
import 'package:miljohack/presentation/profile/widgets/simple_row.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).profile),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(MiljoHack.edit))
        ],
        bottom: const ProfileDescription(),
      ),
      body: ListView(
        children: [
          SimpleRow(
            iconData: MiljoHack.chat,
            title: 'Toppliste',
            onClick: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const LeaderboardPage()));
            },
          ),
          SimpleRow(
            iconData: MiljoHack.bell,
            title: 'Miljøpoeng',
            onClick: () {},
          ),
          SimpleRow(
            iconData: MiljoHack.chat,
            title: 'Hjelp og tilbakemelding',
            onClick: () {},
          ),
          SimpleRow(
            iconData: MiljoHack.email,
            title: 'Markedsføring',
            onClick: () {},
          ),
          SimpleRow(
            iconData: MiljoHack.home,
            title: 'Adresser',
            onClick: () {},
            trailing: Icon(
              MiljoHack.external_link_alt,
              color: AppColors.red[500],
              size: 16,
            ),
          ),
        ],
      ),
    );
  }
}
