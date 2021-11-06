import 'package:flutter/material.dart';
import 'package:miljohack/presentation/core/theme/app_theme.dart';

class ProfileDescription extends StatelessWidget
    implements PreferredSizeWidget {
  const ProfileDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(width: double.infinity, height: 20),
          Text(
            'Espen Vindegg',
            style: TS.of(context).body.copyWith(color: AppColors.white),
          ),
          const SizedBox(height: 10),
          Text(
            '+47 930 67 476',
            style: TS.of(context).body.copyWith(color: AppColors.white),
          ),
          Text(
            'espen@vindegg.com',
            style: TS.of(context).body.copyWith(color: AppColors.white),
          ),
          const SizedBox(height: 10),
          Text(
            'Bekreft e-post',
            style: TS.of(context).body.copyWith(color: AppColors.white),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
