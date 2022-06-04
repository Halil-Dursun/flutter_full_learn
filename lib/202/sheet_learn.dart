import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_full_learn/101/image_learn.dart';
import 'package:flutter_full_learn/101/list_view_learn.dart';

class SheetLearn extends StatefulWidget {
  const SheetLearn({Key? key}) : super(key: key);

  @override
  State<SheetLearn> createState() => _SheetLearnState();
}

class _SheetLearnState extends State<SheetLearn> with ShowModalBottomSheetComponent{
  Color _backgroundColor = Colors.yellow;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(),
      body: Center(
        child: TextButton(onPressed: (){
          customShowBottomSheet(context, const  ListViewLearn());
        }, child: const Text('show model bottom')),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () async {
        final result = await showModalBottomSheet(
            backgroundColor: Colors.blueGrey.withOpacity(0.2), //arkaplan rengi
            barrierColor:
                Colors.transparent, //bottomsheet dışında kalan alanın rengi
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20)), //top a radius verdik
            ),
            isScrollControlled:
                true, //bottom sheet in tüm alana yayılmasını sağlar
            context: context,
            builder: (context) {
              return _CustomSheet();
            });
        inspect(result);
        if (result is bool) {
          setState(() {
            _backgroundColor = Colors.cyan;
          });
        }
      }),
    );
  }
}

class _CustomSheet extends StatefulWidget {
  const _CustomSheet({
    Key? key,
  }) : super(key: key);

  @override
  State<_CustomSheet> createState() => _CustomSheetState();
}

class _CustomSheetState extends State<_CustomSheet> {
  // Color _backgroundColor = Colors.transparent;
  final double _gripHeight = 30;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: _gripHeight,
            child: Stack(
              children: [
                Divider(
                  color: Colors.red,
                  thickness: 3,
                  indent: MediaQuery.of(context).size.width * .45,
                  endIndent: MediaQuery.of(context).size.width * .45,
                ),
                Positioned(
                  right: 10,
                  top: 5,
                  child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const Icon(
                        Icons.close,
                      )),
                ),
              ],
            ),
          ),
          Text('data'),
          Image.network(
            'https://picsum.photos/200',
            height: 200,
          ),
          ElevatedButton(
            onPressed: () {
              //Navigator.pop(context);
              // setState(() {
              //   _backgroundColor = Colors.amber;
              // });
              Navigator.of(context).pop<bool>(false);
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}

mixin ShowModalBottomSheetComponent{
  Future<T?> customShowBottomSheet<T> (BuildContext context,Widget child ) async {
    return await showModalBottomSheet<T>(
            backgroundColor: Colors.blueGrey.withOpacity(0.2), //arkaplan rengi
            barrierColor:
                Colors.transparent, //bottomsheet dışında kalan alanın rengi
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20)), //top a radius verdik
            ),
            //isScrollControlled:true, //bottom sheet in tüm alana yayılmasını sağlar
            context: context,
            builder: (context) {
              return _CustomMainSheet(child: child,);
            });
  }
}

class _CustomMainSheet extends StatelessWidget {
  const _CustomMainSheet({Key? key,required this.child}) : super(key: key);
  final Widget child;

    // Color _backgroundColor = Colors.transparent;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const _BaseSheetHeader(),
          Expanded(child: child),
        ],
      ),
    );
  }
}

class _BaseSheetHeader extends StatelessWidget {
  const _BaseSheetHeader({
    Key? key,
  }) : _gripHeight = 30.0, super(key: key);

  final double _gripHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _gripHeight,
      child: Stack(
        children: [
          Divider(
            color: Colors.red,
            thickness: 3,
            indent: MediaQuery.of(context).size.width * .45,
            endIndent: MediaQuery.of(context).size.width * .45,
          ),
          Positioned(
            right: 10,
            top: 5,
            child: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Icon(
                  Icons.close,
                )),
          ),
        ],
      ),
    );
  }
}
