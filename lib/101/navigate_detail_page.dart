import 'package:flutter/material.dart';

class NavigateDetailPage extends StatefulWidget {
  NavigateDetailPage({Key? key, this.isOkey = false}) : super(key: key);
  bool isOkey;

  @override
  State<NavigateDetailPage> createState() => _NavigateDetailPageState();
}

class _NavigateDetailPageState extends State<NavigateDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () {
            Navigator.of(context).pop(!widget.isOkey);
          },
          label: widget.isOkey ? const Text('Onayla') : const Text('Red'),
          icon: Icon(
            Icons.check,
            color: widget.isOkey ? Colors.green : Colors.red,
          ),
        ),
      ),
    );
  }
}
