import 'package:flutter/material.dart';
import 'package:flutter_notes_app/model/note.dart';
import 'package:flutter_notes_app/utils/notes_database_helper.dart';
import 'package:flutter_notes_app/widgets/home_notes_grid.dart';
import 'package:flutter_notes_app/widgets/search_app_bar.dart';
import 'package:provider/provider.dart';

class SearchNotesView extends StatefulWidget {
  @override
  _SearchNotesViewState createState() => _SearchNotesViewState();
}

class _SearchNotesViewState extends State<SearchNotesView> {
  NotesDatabaseHelper database;
  Future futureSearch;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBar(
        onSearchText: _searchText,
      ),
      body: Consumer<NotesDatabaseHelper>(
        builder: (context, database, child) {
          this.database = database;
          return FutureBuilder<List<Note>>(
            future: futureSearch,
            builder: (context, snapshot) {
              if (snapshot.data != null && snapshot.data.isNotEmpty) {
                return HomeNotesGrid(
                  notes: snapshot.data,
                );
              } else if (snapshot.data != null && snapshot.data.isEmpty) {
                return Center(
                  child: Text('Nothing found'),
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Center(
                  child: Text('Here you can find for your saved notes'),
                );
              }
            },
          );
        },
      ),
    );
  }

  _searchText(String textToSearch) {
    setState(() {
      futureSearch = database.searchForNotes(textToSearch);
    });
  }
}
