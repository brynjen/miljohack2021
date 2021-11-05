import 'package:flutter/material.dart';

class GretaEasterDialog extends StatelessWidget {
  const GretaEasterDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Booo'),
      contentPadding: const EdgeInsets.all(20),
      content: Image.asset(
        'assets/gifs/greta.gif',
        width: 150,
        height: 150,
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Lei meg'),
        )
      ],
    );
  }
}
