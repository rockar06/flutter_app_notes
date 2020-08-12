import 'package:flutter/material.dart';
import 'package:flutter_notes_app/model/note.dart';
import 'package:flutter_notes_app/utils/constants.dart';
import 'package:flutter_notes_app/utils/notes_database_helper.dart';
import 'package:flutter_notes_app/widgets/buttons/delete_button.dart';
import 'package:flutter_notes_app/widgets/buttons/save_button.dart';
import 'package:provider/provider.dart';

import 'buttons/back_button.dart';

class SingleAppBar extends StatefulWidget implements PreferredSizeWidget {
  final TextEditingController titleController;
  final TextEditingController noteController;
  final Note note;

  const SingleAppBar(
      {Key key,
      @required this.titleController,
      @required this.noteController,
      this.note})
      : super(key: key);

  @override
  _SingleAppBarState createState() => _SingleAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(Size56);
}

class _SingleAppBarState extends State<SingleAppBar> {
  List<Widget> _appBarActions = [];

  @override
  void initState() {
    _setupNoteIfNeeded();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      brightness: Brightness.light,
      backgroundColor: Colors.transparent,
      elevation: SizeZero,
      actions: _appBarActions,
      leading: InkBackButton(),
    );
  }

  _onDeleteNote() {
    Provider.of<NotesDatabaseHelper>(context).deleteNoteWithId(widget.note.id);
    Navigator.pop(context);
  }

  _onSaveNote() {
    if (widget.note != null) {
      _updateNote();
    } else {
      _saveNewNote();
    }
    Navigator.pop(context);
  }

  _setupNoteIfNeeded() {
    if (widget.note != null) {
      setState(() {
        _setTextInControllers();
        _addSaveNoteAction();
        _addDeleteNoteAction();
      });
    } else {
      setState(() {
        _addSaveNoteAction();
      });
    }
  }

  _addSaveNoteAction() {
    _appBarActions.add(
      InkSaveButton(onTap: _onSaveNote),
    );
  }

  _addDeleteNoteAction() {
    _appBarActions.add(
      InkDeleteButton(
        onTap: _onDeleteNote,
      ),
    );
  }

  _setTextInControllers() {
    widget.titleController.text = widget.note.title;
    widget.noteController.text = widget.note.note;
  }

  _updateNote() {
    var noteToUpdate = Note(
      widget.note.id,
      widget.titleController.text,
      widget.noteController.text,
      _getTimeStamp(),
    );
    Provider.of<NotesDatabaseHelper>(context).updateNote(noteToUpdate);
  }

  _saveNewNote() {
    var noteToSave = Note(_getUniqueId(), widget.titleController.text,
        widget.noteController.text, _getTimeStamp());
    Provider.of<NotesDatabaseHelper>(context).insertNote(noteToSave);
  }

  String _getUniqueId() {
    return UniqueKey().toString();
  }

  String _getTimeStamp() {
    return DateTime.now().millisecondsSinceEpoch.toString();
  }
}
