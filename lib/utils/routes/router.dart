import 'package:flutter/material.dart';
import 'package:flutter_notes_app/view/add/add_note_view.dart';
import 'package:flutter_notes_app/view/default/default_view.dart';
import 'package:flutter_notes_app/view/home/home_view.dart';
import 'package:flutter_notes_app/view/search/search_notes_view.dart';
import 'package:flutter_notes_app/view/tuto/tuto_view.dart';

class Router {
  static const Home = '/';
  static const Add_Note = '/add_note';
  static const Search_Note = '/search_note';
  static const Tutorial = '/tutorial';

  Router._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Home:
        return _getRoute(HomeView(), settings);
      case Add_Note:
        return _getRoute(AddNoteView(), settings);
      case Search_Note:
        return _getRoute(SearchNotesView(), settings);
      case Tutorial:
        return _getRoute(TutorialView(), settings);
      default:
        return _getRoute(DefaultView(), settings);
    }
  }

  static MaterialPageRoute _getRoute(Widget child, RouteSettings settings) =>
      //SlideUpFadeRoute(widget: child, settings: settings);
      MaterialPageRoute(builder: (context) => child, settings: settings);
}
