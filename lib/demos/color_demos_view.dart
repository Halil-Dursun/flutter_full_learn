import 'dart:developer';

import 'package:flutter/material.dart';

class ColorDemosView extends StatefulWidget {
  ColorDemosView({Key? key,this.initialColor}) : super(key: key);
  final Color? initialColor;

  @override
  State<ColorDemosView> createState() => _ColorDemosViewState();
}

class _ColorDemosViewState extends State<ColorDemosView> {

  @override
  void initState() {
    super.initState();
    _activeColor = widget.initialColor ?? Colors.transparent;
  }
  Color? _activeColor;

  void _changeColor(Color color) {
    setState(() {
      _activeColor = color;
    });
  }
  @override
  void didUpdateWidget(covariant ColorDemosView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if(oldWidget.initialColor != _activeColor && _activeColor != null){
      _changeColor(widget.initialColor!);
    }
  }

  @override
  Widget build(Object context) {
    return Scaffold(
      backgroundColor: _activeColor,
      bottomNavigationBar: BottomNavigationBar(
          onTap: _onTapColor,
          items: [
            BottomNavigationBarItem(
                icon: _ColorContainer(
                  color: Colors.red,
                ),
                label: "Red"),
            BottomNavigationBarItem(
                icon: _ColorContainer(
                  color: Colors.yellow,
                ),
                label: "Yellow"),
            BottomNavigationBarItem(
                icon: _ColorContainer(
                  color: Colors.blue,
                ),
                label: "Blue"),
          ]),
    );
  }

  void _onTapColor(value) {
          if (value == _MyColors.red.index) {
            _changeColor(Colors.red);
          } else if (value == _MyColors.yellow.index) {
            _changeColor(Colors.yellow);
          } else if (value == _MyColors.blue.index) {
            _changeColor(Colors.blue);
          }
          // switch (value) {
          //   case 0:
          //     _changeColor(Colors.red);
          //     break;
          //   case 1:
          //     _changeColor(Colors.yellow);
          //     break;
          //   case 2:
          //     _changeColor(Colors.blue);
          //     break;
          //   default:
          // }
        }
}

enum _MyColors {
  red,
  yellow,
  blue,
}

class _ColorContainer extends StatelessWidget {
  Color color;
  _ColorContainer({
    required this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(height: 10, width: 10, color: color);
  }
}
