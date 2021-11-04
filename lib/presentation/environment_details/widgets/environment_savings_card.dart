import 'package:flutter/material.dart';
import 'package:miljohack/domain/main/data/mail_package.dart';
import 'package:miljohack/presentation/core/icons/miljo_hack_icons.dart';
import 'package:miljohack/presentation/core/theme/app_theme.dart';

class EnvironmentSavingsCard extends StatefulWidget {
  const EnvironmentSavingsCard({required this.mailPackage, Key? key})
      : super(key: key);
  final MailPackage mailPackage;

  @override
  State<EnvironmentSavingsCard> createState() => _EnvironmentSavingsCardState();
}

class _EnvironmentSavingsCardState extends State<EnvironmentSavingsCard> {
  var _wantEnvironment = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Image.asset(
              'assets/images/environment_camouflage.png',
              height: 184,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [Icon(MiljoHack.chat_bubble_outline)],
                ),
              ],
            )
          ],
        ),
        Container(
          decoration: BoxDecoration(
              border: Border(
            left: BorderSide(color: AppColors.darkRed),
            right: BorderSide(color: AppColors.darkRed),
            bottom: BorderSide(color: AppColors.darkRed),
          )),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Ja takk, gjør pakken min mer bærekraftig'),
                  Switch(
                    onChanged: (newState) {
                      setState(() {
                        _wantEnvironment = newState;
                      });
                    },
                    value: _wantEnvironment,
                  )
                ],
              ),
              Text('Her kan du lese mer om bærekraftig frakt')
            ],
          ),
        ),
      ],
    );
  }
}
