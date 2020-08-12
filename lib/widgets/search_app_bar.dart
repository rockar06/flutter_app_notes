import 'package:flutter/material.dart';
import 'package:flutter_notes_app/utils/constants.dart';

import 'buttons/back_button.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Function(String) onSearchText;
  final textController = TextEditingController();

  SearchAppBar({Key key, @required this.onSearchText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: HeroToolbar,
      child: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        leading: InkBackButton(),
        titleSpacing: SizeZero,
        title: TextField(
          autofocus: true,
          controller: textController,
          decoration: InputDecoration(
            hintText: 'Search notes',
            border: InputBorder.none,
          ),
          textInputAction: TextInputAction.search,
          onSubmitted: onSearchText,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(Size56);
}
