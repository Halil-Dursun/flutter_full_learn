import 'package:flutter/material.dart';

class FormLearnView extends StatefulWidget {
  const FormLearnView({Key? key}) : super(key: key);

  @override
  State<FormLearnView> createState() => _FormLearnViewState();
}

class _FormLearnViewState extends State<FormLearnView> {
  late final GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        autovalidateMode: AutovalidateMode.always,
        key: _formKey,
        onChanged: (){
          print('a');
        },
        child: Column(
          children: [
            TextFormField(
              validator: FormFieldValidator().isNotEmpty,
            ),
            TextFormField(
              validator: FormFieldValidator().isNotEmpty,
            ),
            DropdownButtonFormField<String>(
              validator: FormFieldValidator().isNotEmpty,
              //value: 'v',
              items: const [
              DropdownMenuItem(child: Text('a'),value: 'v',),
              DropdownMenuItem(child: Text('abbb'),value: 'v2',),
              DropdownMenuItem(child: Text('abbbbbb'),value: 'v3',),
            ], onChanged: (value){
            }),
            CheckboxListTile(value: true, onChanged: (_){}),
            ElevatedButton(onPressed: (){
              if(_formKey.currentState?.validate() ?? false){
                print('validation succes');
              }
            }, child: const Text('Kaydet'),),
          ],
        ),
      ),
    );
  }
}

class FormFieldValidator{

  String? isNotEmpty(String? data){
    return (data?.isNotEmpty ?? false) ? null : FormValidatorMessage._notEmptyMessage;
  }
}

class FormValidatorMessage{
  static const String _notEmptyMessage = 'Bu alan boş geçilemez';
}