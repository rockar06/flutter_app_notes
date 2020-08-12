import 'package:flutter/material.dart';
import 'package:flutter_notes_app/utils/routes/router.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Notes App',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textSelectionHandleColor: Colors.black87,
        textSelectionColor: Colors.black26,
        cursorColor: Colors.black26,
      ),
      initialRoute: Router.Home,
      onGenerateRoute: Router.generateRoute,
    );
  }
}
