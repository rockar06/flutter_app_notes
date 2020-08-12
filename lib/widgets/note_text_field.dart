import 'package:flutter/material.dart';

enum NoteTextFieldType { Title, Subtitle }

class NoteTextField extends StatelessWidget {
  final String title;
  final NoteTextFieldType textFieldType;
  final TextEditingController textEditingController;

  const NoteTextField(
      {Key key,
      @required this.title,
      @required this.textFieldType,
      @required this.textEditingController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: title,
        hintStyle: _getHintStyle(context),
      ),
      keyboardType: TextInputType.multiline,
      maxLines: textFieldType == NoteTextFieldType.Title ? 3 : null,
      minLines: 1,
      style: _getTextStyle(context),
    );
  }

  TextStyle _getHintStyle(BuildContext context) {
    if (textFieldType == NoteTextFieldType.Title) {
      return Theme.of(context).textTheme.headline5.copyWith(
            color: Colors.black26,
          );
    } else {
      return Theme.of(context).textTheme.subtitle1.copyWith(
            color: Colors.black26,
          );
    }
  }

  TextStyle _getTextStyle(BuildContext context) {
    if (textFieldType == NoteTextFieldType.Title) {
      return Theme.of(context).textTheme.headline5;
    } else {
      return Theme.of(context).textTheme.subtitle1;
    }
  }
}
