import 'package:flutter/material.dart';

class StatefullLifeCycleLearn extends StatefulWidget {
  StatefullLifeCycleLearn({Key? key, required this.message}) : super(key: key);
  String message;

  @override
  State<StatefullLifeCycleLearn> createState() =>
      _StatefullLifeCycleLearnState();
}

class _StatefullLifeCycleLearnState extends State<StatefullLifeCycleLearn> {
  String _message = '';
  late final bool _isOdd;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("c");
  }

  @override
  void didUpdateWidget(covariant StatefullLifeCycleLearn oldWidget) {
    super.didUpdateWidget(oldWidget);
    if(oldWidget.message != widget.message){
      _message = widget.message;
      _compteName();
      setState(() {});
    }
    print("b");
  }

  @override
  void initState() {
    super.initState();
    _message =widget.message;
    _isOdd = widget.message.length.isOdd;
    _compteName();
    print("a");
  }

  void _compteName() {
    if(_isOdd){
      _message += " Çift";
    }else{
      _message += " Tek";
    }
  }

  @override
  void dispose() {
    super.dispose();
    print("alo");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_message),
      ),
      body: _isOdd
          ? TextButton(
              onPressed: () {},
              child: Text(_message),
            )
          : ElevatedButton(
              onPressed: () {},
              child: Text(_message),
            ),
    );
  }
}
