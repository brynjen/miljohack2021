import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:miljohack/application/main/package_list/package_list.dart';
import 'package:miljohack/domain/main/data/mail_package.dart';
import 'package:miljohack/infrastructure/network/api_client.dart';
import 'package:miljohack/presentation/core/icons/miljo_hack_icons.dart';
import 'package:miljohack/presentation/core/theme/app_theme.dart';
import 'package:miljohack/presentation/environment_details/pages/environment_extra.dart';

class EnvironmentSavingsCard extends StatefulWidget {
  const EnvironmentSavingsCard({required this.mailPackage, Key? key})
      : super(key: key);
  final MailPackage mailPackage;

  @override
  State<EnvironmentSavingsCard> createState() => _EnvironmentSavingsCardState();
}

class _EnvironmentSavingsCardState extends State<EnvironmentSavingsCard> {
  var _wantEnvironment = false;
  var _switchEnabled = true;
  final ApiClient apiClient = GetIt.instance.get<ApiClient>();

  @override
  void initState() {
    super.initState();
    _wantEnvironment = widget.mailPackage.climateOptimized;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              right: 0,
              child: Image.asset(
                'assets/images/environment_camouflage.png',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        MiljoHack.chat_bubble_outline,
                        color: AppColors.white,
                      ),
                      const SizedBox(width: 10),
                      Container(
                        color: AppColors.red[600]!,
                        child: Text('Gjør pakken bærekraftig!',
                            style:
                                TS.subtitle.copyWith(color: AppColors.white)),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Denne pakken kan leveres sammen med andre pakker du har på vei. Da sparer du miljøet og tjener Miljøpoeng!',
                    style: TS.body.copyWith(color: AppColors.white),
                  ),
                ],
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 0, bottom: 1, right: 1),
          child: Container(
            decoration: BoxDecoration(
                color: CardTheme.of(context).color,
                border: Border(
                  left: BorderSide(color: AppColors.red[600]!),
                  right: BorderSide(color: AppColors.red[600]!),
                  bottom: BorderSide(color: AppColors.red[600]!),
                )),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          'Ja takk, gjør pakken min mer bærekraftig',
                          style: TS.fatSubTitle,
                        ),
                      ),
                      Switch(
                        onChanged: _switchEnabled
                            ? (newState) async {
                                setState(() {
                                  _switchEnabled = false;
                                });
                                if (newState) {
                                  await apiClient.optimizePackage(
                                      packageId: widget.mailPackage.id);
                                } else {
                                  await apiClient.unOptimizePackage(
                                      packageId: widget.mailPackage.id);
                                }
                                BlocProvider.of<PackageListBloc>(context).add(
                                    UpdatedId(
                                        id: widget.mailPackage.id,
                                        newValue: newState));
                                setState(() {
                                  _wantEnvironment = newState;
                                  _switchEnabled = true;
                                });
                              }
                            : null,
                        value: _wantEnvironment,
                      )
                    ],
                  ),
                  const SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => const EnvironmentExtra()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        'Her kan du lese mer om bærekraftig frakt',
                        style: TS.link,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
