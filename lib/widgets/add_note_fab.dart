import 'package:flutter/material.dart';
import 'package:flutter_notes_app/utils/routes/router.dart';

class AddNoteFloatingActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.white,
      onPressed: () => _launchAddNoteView(context),
      child: Icon(
        Icons.add,
        color: Colors.black54,
      ),
    );
  }

  _launchAddNoteView(BuildContext context) {
    Navigator.pushNamed(context, Router.Add_Note);
  }
}
