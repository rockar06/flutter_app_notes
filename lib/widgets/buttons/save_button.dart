import 'package:flutter/material.dart';

class InkSaveButton extends StatelessWidget {
  final Function onTap;

  const InkSaveButton({Key key, @required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.done,
        color: Colors.black54,
      ),
      onPressed: onTap,
    );
  }
}
