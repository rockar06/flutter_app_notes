import 'package:flutter/material.dart';
import 'package:flutter_notes_app/utils/constants.dart';
import 'package:flutter_notes_app/utils/routes/router.dart';
import 'package:flutter_notes_app/widgets/buttons/search_button.dart';

class SearchRowItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkSearchButton(),
        Expanded(
          child: GestureDetector(
            onTap: () => _goToSearchView(context),
            child: Text(
              SearchNotesText,
              style: TextStyle(color: Colors.black54),
            ),
          ),
        )
      ],
    );
  }

  _goToSearchView(BuildContext context) {
    Navigator.pushNamed(context, Router.Search_Note);
  }
}
