import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miljohack/application/main/package_list/package_list.dart';
import 'package:miljohack/domain/main/data/mail_package.dart';
import 'package:miljohack/presentation/main/pages/package_details.dart';
import 'package:miljohack/presentation/main/widgets/package_card.dart';

class ForMe extends StatefulWidget {
  const ForMe({Key? key}) : super(key: key);

  @override
  State<ForMe> createState() => _ForMeState();
}

class _ForMeState extends State<ForMe> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(Image.asset('assets/gifs/greta.gif').image, context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child:
          BlocBuilder<PackageListBloc, PackageListState>(builder: (_, state) {
        if (state is LoadingPackages) {
          return PackageList(mailPackages: state.mailPackages);
        } else if (state is LoadedPackages) {
          return PackageList(mailPackages: state.mailPackages);
        } else if (state is NoPackages) {
          return Container();
        } else {
          throw ArgumentError('Invalid state');
        }
      }),
    );
  }
}

class PackageList extends StatelessWidget {
  const PackageList({required this.mailPackages, Key? key}) : super(key: key);
  final List<MailPackage> mailPackages;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
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
    );
  }
}
