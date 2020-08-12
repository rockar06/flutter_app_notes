import 'package:flutter/material.dart';
import 'package:flutter_notes_app/model/note.dart';
import 'package:flutter_notes_app/utils/hidden_scroll_glow_behaviour.dart';
import 'package:flutter_notes_app/utils/notes_database_helper.dart';
import 'package:flutter_notes_app/widgets/add_note_fab.dart';
import 'package:flutter_notes_app/widgets/empty_notes_view.dart';
import 'package:flutter_notes_app/widgets/home_notes_grid.dart';
import 'package:flutter_notes_app/widgets/transparent_sliver_app_bar.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScrollConfiguration(
        behavior: HiddenScrollGlowBehaviour(),
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxScrolled) => [
            TransparentSliverAppBar(
              forceElevated: innerBoxScrolled,
            ),
          ],
          body: Consumer<NotesDatabaseHelper>(
            builder: (context, database, child) => FutureBuilder<List<Note>>(
                future: database.getAllNotes(),
                builder: (context, snapshot) {
                  if (snapshot.data != null && snapshot.data.isNotEmpty) {
                    return HomeNotesGrid(
                      notes: snapshot.data,
                    );
                  } else if (snapshot.data != null && snapshot.data.isEmpty) {
                    return EmptyNotesView();
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          ),
        ),
      ),
      floatingActionButton: AddNoteFloatingActionButton(),
    );
  }
}
