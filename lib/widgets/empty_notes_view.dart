import 'package:flutter/material.dart';
import 'package:flutter_notes_app/widgets/add_note_info.dart';

class EmptyNotesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('You doesn\'t have any notes yet'),
          AddNoteInfo(),
        ],
      ),
    );
  }
}
