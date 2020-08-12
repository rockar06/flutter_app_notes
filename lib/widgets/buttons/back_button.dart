import 'package:flutter/material.dart';
import 'package:flutter_notes_app/utils/constants.dart';

class InkBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Size8),
      child: InkWell(
        borderRadius: BorderRadius.circular(Size30),
        onTap: () => _backToHomeView(context),
        child: Icon(
          Icons.arrow_back,
          color: Colors.black54,
        ),
      ),
    );
  }

  _backToHomeView(BuildContext context) {
    Navigator.pop(context);
  }
}
