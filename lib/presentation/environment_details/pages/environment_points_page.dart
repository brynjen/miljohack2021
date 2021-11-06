import 'package:flutter/material.dart';
import 'package:miljohack/generated/l10n.dart';
import 'package:miljohack/presentation/core/icons/miljo_hack_icons.dart';
import 'package:miljohack/presentation/core/theme/app_theme.dart';
import 'package:miljohack/presentation/core/widgets/smiley_card.dart';
import 'package:miljohack/presentation/environment_details/widgets/dollar_container.dart';
import 'package:miljohack/presentation/environment_details/widgets/reward_row.dart';

class EnvironmentPointsPage extends StatelessWidget {
  const EnvironmentPointsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detaljer')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          SmileyCard(text: S.of(context).helpful_text),
          const SizedBox(height: 10),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Du har 4535 poeng', style: TS.of(context).bold),
                  const SizedBox(height: 10),
                  Container(
                    color: AppColors.red[500],
                    child: Text(
                      'Wow! Velg deg en premie her!',
                      style: TS
                          .of(context)
                          .bold
                          .copyWith(color: AppColors.white, fontSize: 21),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Velg en premie fra listen, så sender vi den rett hjem til deg - klimaoptimert så klart :)',
                    style: TS.of(context).body,
                  ),
                  const SizedBox(height: 20),
                  RewardRow(
                    icon: MiljoHack.t_shirt,
                    text: 'Klimaoptimert! t-skjorte',
                    onClick: () {},
                  ),
                  const SizedBox(height: 10),
                  RewardRow(
                    icon: MiljoHack.gift,
                    text: 'Kaffebrenneriet gavekort til en venn',
                    onClick: () {},
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const DollarContainer(),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Du har fått en perk!',
                          style: TS.of(context).fatSubTitle,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '5 % rabatt på frakt på alle pakker bestilt gjennom appen neste 6 mnd :)',
                          style: TS.of(context).body,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
