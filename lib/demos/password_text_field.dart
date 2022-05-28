import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  TextEditingController? controller;
  PasswordTextField({Key? key, this.controller}) : super(key: key);

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  String _obscurinCharacter = '*';
  bool _isVisibile = true;

  void changeVisibility() {
    setState(() {
      _isVisibile = !_isVisibile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      autofillHints: const [AutofillHints.password],
      obscureText: _isVisibile,
      obscuringCharacter: _obscurinCharacter,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        hintText: 'Password',
        suffix: _visibilityIconButton(),
      ),
    );
  }

  IconButton _visibilityIconButton() {
    return IconButton(
      onPressed: () {
        changeVisibility();
      },
      //icon: Icon(_isVisibile ? Icons.visibility : Icons.visibility_off),
      icon: AnimatedCrossFade(
          firstChild: const Icon(Icons.visibility_outlined),
          secondChild: const Icon(Icons.visibility_off_outlined),
          crossFadeState: _isVisibile
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
          duration: const Duration(seconds: 2)),
    );
  }
}
