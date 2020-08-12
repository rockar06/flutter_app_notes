import 'package:flutter/material.dart';
import 'package:flutter_notes_app/utils/constants.dart';
import 'package:flutter_notes_app/widgets/search_row_items.dart';

class ProfileSearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.fromLTRB(Size16, SizeZero, Size16, SizeZero),
        child: Hero(
          tag: HeroToolbar,
          child: Card(
            elevation: SearchCardElevation,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Size8),
            ),
            child: SizedBox(
              height: SearchCardHeight,
              child: Container(
                child: SearchRowItems(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
