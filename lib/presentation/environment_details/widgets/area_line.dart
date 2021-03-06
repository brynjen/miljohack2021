import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:miljohack/domain/environment_details/area_score.dart';
import 'package:miljohack/presentation/core/theme/app_theme.dart';

class AreaLine extends StatelessWidget {
  const AreaLine({required this.areaScore, Key? key}) : super(key: key);
  final AreaScore areaScore;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('${areaScore.placement}.', style: TS.of(context).body),
        const SizedBox(width: 5),
        Expanded(
          child: Text('${areaScore.area} - ${_toPercent(areaScore.score)}',
              style: areaScore.marked
                  ? TS.of(context).body.copyWith(fontWeight: FontWeight.w800)
                  : TS.of(context).body),
        ),
      ],
    );
  }

  String _toPercent(double value) {
    return NumberFormat.percentPattern("ar")
        .format(value); //NumberFormvalue * 100;
  }
}
