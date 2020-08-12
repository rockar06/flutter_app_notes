import 'package:flutter/material.dart';

class InkDeleteButton extends StatelessWidget {
  final Function onTap;

  const InkDeleteButton({Key key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.delete,
        color: Colors.black54,
      ),
      onPressed: onTap,
    );
  }
}
