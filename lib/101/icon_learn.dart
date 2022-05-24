import 'package:flutter/material.dart';

class IconLearnView extends StatelessWidget {
  IconLearnView({ Key? key }) : super(key: key);
  IconSizes iconSizes = IconSizes();
  IconColors iconColors = IconColors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('IconLearnView')),
      body:Column(
        children: [
          IconButton(
            icon: Icon(Icons.message_outlined),
            onPressed: (){},
            color: Theme.of(context).backgroundColor,
            iconSize: IconSizes.iconSmall2x,
          ),
          IconButton(
            icon: Icon(Icons.message_outlined),
            onPressed: (){},
            color: iconColors.froly,
            iconSize: iconSizes.iconSmall,
          ),
          IconButton(
            icon: Icon(Icons.message_outlined),
            onPressed: (){},
            color: iconColors.froly,
            iconSize: iconSizes.iconSmall,
          ),
        ],
      ),
    );
  }
}

class IconSizes{
  final double iconSmall = 40;
  static const double iconSmall2x = 80;
}
class IconColors {
  final Color froly = const Color(0xffED617A);
}