import 'package:flutter/material.dart';

class CupertinoTextFieldForm extends StatelessWidget {
  final String hintText;
  final String Function(String) validator;
  final ValueChanged<String> onChanged;
  final TextInputType textInputType;
  final String initialText;

  CupertinoTextFieldForm({
    Key key,
    this.hintText = 'Hint',
    @required this.validator,
    this.onChanged,
    this.textInputType = TextInputType.text,
    this.initialText = "",
  })  : assert(validator != null),
        assert(onChanged != null),
        super(key: key);

  CupertinoTextFieldForm.textRequired({
    Key key,
    hintText = 'Hint',
    @required ValueChanged<String> onChanged,
    textInputType = TextInputType.text,
    initialText = "",
  }) : this(
          key: key,
          validator: (value) => value.isEmpty ? '' : null,
          hintText: hintText,
          onChanged: onChanged,
          textInputType: textInputType,
          initialText: initialText,
        );

  CupertinoTextFieldForm.noCheck({
    Key key,
    hintText = 'Hint',
    @required ValueChanged<String> onChanged,
    textInputType = TextInputType.text,
    initialText = "",
  }) : this(
          key: key,
          validator: (value) => null,
          hintText: hintText,
          onChanged: onChanged,
          textInputType: textInputType,
          initialText: initialText,
        );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: onChanged,
      initialValue: initialText,
      decoration: InputDecoration(
        fillColor: Colors.grey[200],
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16.0),
          ),
          borderSide: BorderSide.none,
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.black.withOpacity(0.3),
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 12.0,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.0,
          ),
        ),
        errorStyle: TextStyle(height: 0),
      ),
      cursorWidth: 1,
      cursorColor: Colors.black,
      validator: validator,
    );
  }
}
