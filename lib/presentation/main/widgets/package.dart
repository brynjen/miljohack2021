import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';

class Package extends StatelessWidget {
  const Package({required this.id, required this.name, Key? key})
      : super(key: key);

  final String id;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            const Icon(CommunityMaterialIcons.package_variant_closed),
            Expanded(
              child: ListTile(
                title: Text('Pakke:$id'),
                subtitle: Text(name),
              ),
            )
          ],
        ),
      ),
    );
  }
}
