import 'package:flutter/material.dart';
import 'package:flutter_notes_app/utils/constants.dart';
import 'package:flutter_notes_app/utils/routes/router.dart';

class InkSearchButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Size8),
      child: InkWell(
        borderRadius: BorderRadius.circular(Size30),
        onTap: () => _goToSearchView(context),
        child: Icon(
          Icons.search,
          color: Colors.black54,
        ),
      ),
    );
  }

  _goToSearchView(BuildContext context) {
    Navigator.pushNamed(context, Router.Search_Note);
  }
}
