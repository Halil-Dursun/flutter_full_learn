import 'dart:developer';

import 'package:flutter/material.dart';

class AlertLearn extends StatefulWidget {
  const AlertLearn({Key? key}) : super(key: key);

  @override
  State<AlertLearn> createState() => _AlertLearnState();
}

class _AlertLearnState extends State<AlertLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () async {
        // showAboutDialog(
        //   context: context,
        //   applicationName: 'HD',
        //   children: [
        //     const Text('data'),
        //   ],
        // );
        final result = await showDialog(
            barrierDismissible:
                true, //tuşlara basmak zorunda kenara basarak çıkamaz,
            context: context,
            builder: (context) {
              return _ImageZoomDialog();
            });
        inspect(result);
      }),
      appBar: AppBar(),
    );
  }
}

class _MyAlertDialog extends StatelessWidget {
  const _MyAlertDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Alerdialog title'),
      actions: [
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            child: const Text(
              'Accept',
              style: TextStyle(color: Colors.blue),
            )),
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Close')),
      ],
    );
  }
}

class Keys {
  static const versionUpdate = 'Version Update';
}

class UpdateDialog extends AlertDialog {
  UpdateDialog({Key? key, required BuildContext context})
      : super(
          key: key,
          title: const Text(Keys.versionUpdate),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: const Text(
                  'Accept',
                  style: TextStyle(color: Colors.blue),
                )),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Close')),
          ],
        );
}

class _ImageZoomDialog extends StatelessWidget {
  const _ImageZoomDialog({
    Key? key,
  }) : super(key: key);

  final String _url = 'https://picsum.photos/200';

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding:EdgeInsets.zero,
      child: InteractiveViewer(//resimlere büyütme özelliği verebiliyoruz.
        child: Image.network(
          _url,
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height * .60,
        ),
      ),
    );
  }
}
