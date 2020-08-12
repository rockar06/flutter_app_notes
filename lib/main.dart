import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_notes_app/utils/notes_database_helper.dart';
import 'package:provider/provider.dart';

import 'my_app.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(
    ChangeNotifierProvider(
      create: (context) => NotesDatabaseHelper(),
      child: MyApp(),
    ),
  );
}
