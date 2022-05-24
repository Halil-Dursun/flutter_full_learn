import 'package:flutter/material.dart';

class ButtonLearn extends StatelessWidget {
  const ButtonLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {},
            child: Text(
              'TextButton',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.green;
              } else {
                return Colors.blue;
              }
            })),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Elevated Button'),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.abc_sharp),
          ),
          OutlinedButton(
            onPressed: () {},
            child: Text('OutlinedButton'),
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.red,
              padding: EdgeInsets.all(10),
              //shape: CircleBorder(),
            ),
          ),
          InkWell(onTap: () {}, child: Text('TextButtton')),
          Container(
            height: 200,
            color: Colors.white,
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 20.0, bottom: 20, right: 40, left: 40),
              child: Text(
                'Place Bid',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          )
        ],
      ),
    );
  }
}
