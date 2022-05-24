import 'package:flutter/material.dart';

class TextLearnView extends StatelessWidget {
  TextLearnView({Key? key}) : super(key: key);
  ProjectKeys keys = ProjectKeys();
  String name = 'halil';
  String? userName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              ('Name $name ${name.length}'),
              style: ProjectStyle.welcomeStyle,
              maxLines: 2,
            ),
            Text(
              ('Name $name ${name.length}'),
              style: ProjectStyle.welcomeStyle,
              maxLines: 2,
            ),
            Text(
              ('Name $name ${name.length}'),
              style: Theme.of(context).textTheme.headline5?.copyWith(
                color: Colors.lime
              ),
              maxLines: 2,
            ),
            Text(userName ?? 'boş'),
            Text(keys.welcome)
          ],
        ),
      ),
    );
  }
}

class ProjectStyle {
  static TextStyle welcomeStyle = TextStyle(
    overflow: TextOverflow.ellipsis,
    wordSpacing: 2,
    letterSpacing: 2,
    decoration: TextDecoration.underline,
    fontSize: 16,
    color: ProjectColors.welcomeColor,
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.bold,
  );
}

class ProjectColors{
  static Color  welcomeColor = Colors.red;
}

class ProjectKeys {
  final String welcome = "merhaba";
}