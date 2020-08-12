import 'package:flutter/material.dart';
import 'package:flutter_notes_app/model/note.dart';
import 'package:flutter_notes_app/utils/constants.dart';
import 'package:flutter_notes_app/widgets/note_text_field.dart';
import 'package:flutter_notes_app/widgets/single_app_bar.dart';

class AddNoteView extends StatelessWidget {
  final titleController = TextEditingController();
  final noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var note = _getNoteArgumentIfExist(context);
    return Scaffold(
      appBar: SingleAppBar(
        titleController: titleController,
        noteController: noteController,
        note: note,
      ),
      body: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: Size8, horizontal: Size18),
        child: ListView(
          children: [
            NoteTextField(
              textEditingController: titleController,
              title: TitleText,
              textFieldType: NoteTextFieldType.Title,
            ),
            NoteTextField(
              textEditingController: noteController,
              title: SubtitleText,
              textFieldType: NoteTextFieldType.Subtitle,
            )
          ],
        ),
      ),
    );
  }

  Note _getNoteArgumentIfExist(BuildContext context) {
    var settings = _getRouteSettings(context);
    return settings.arguments;
  }

  RouteSettings _getRouteSettings(BuildContext context) {
    return ModalRoute.of(context).settings;
  }
}
