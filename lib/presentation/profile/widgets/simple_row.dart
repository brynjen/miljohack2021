import 'package:flutter/material.dart';
import 'package:miljohack/presentation/core/theme/app_theme.dart';

class SimpleRow extends StatelessWidget {
  const SimpleRow(
      {required this.iconData,
      required this.title,
      required this.onClick,
      this.trailing,
      Key? key})
      : super(key: key);

  final IconData iconData;
  final String title;
  final Function()? onClick;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              iconData,
              color: AppColors.red[500],
            ),
            const SizedBox(width: 10),
            Expanded(
                child: Text(title,
                    style: TS
                        .of(context)
                        .bold
                        .copyWith(fontWeight: FontWeight.w700))),
            SizedBox(
                width: 30,
                height: 30,
                child: Center(
                  child: trailing != null
                      ? trailing!
                      : Icon(Icons.arrow_forward_ios_sharp,
                          color: AppColors.red[500]),
                ))
          ],
        ),
      ),
    );
  }
}
