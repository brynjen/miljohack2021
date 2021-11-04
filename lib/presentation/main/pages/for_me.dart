import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miljohack/application/main/package_list/package_list.dart';
import 'package:miljohack/domain/main/data/mail_package.dart';
import 'package:miljohack/presentation/core/app_theme.dart';
import 'package:miljohack/presentation/main/pages/package_details.dart';
import 'package:miljohack/presentation/main/widgets/package_card.dart';

class ForMe extends StatelessWidget {
  const ForMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PackageListBloc, PackageListState>(builder: (_, state) {
      if (state is LoadingPackages) {
        return PackageList(mailPackages: state.mailPackages);
      } else if (state is LoadedPackages) {
        return PackageList(mailPackages: state.mailPackages);
      } else if (state is NoPackages) {
        return Container();
      } else {
        throw ArgumentError('Invalid state');
      }
    });
  }
}

class PackageList extends StatelessWidget {
  const PackageList({required this.mailPackages, Key? key}) : super(key: key);
  final List<MailPackage> mailPackages;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.greyBg,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        itemBuilder: (_, index) {
          final package = mailPackages[index];
          return PackageCard(
            mailPackage: package,
            onClick: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => PackageDetails(mailPackage: package)));
            },
          );
        },
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemCount: mailPackages.length,
      ),
    );
  }
}
