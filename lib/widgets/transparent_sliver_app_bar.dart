import 'package:flutter/material.dart';
import 'package:flutter_notes_app/utils/constants.dart';
import 'package:flutter_notes_app/widgets/profile_search_bar.dart';

class TransparentSliverAppBar extends StatelessWidget {
  final bool forceElevated;

  const TransparentSliverAppBar({Key key, this.forceElevated})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      brightness: Brightness.light,
      elevation: SliverAppBarElevation,
      forceElevated: forceElevated,
      floating: true,
      snap: true,
      backgroundColor: Colors.transparent,
      flexibleSpace: ProfileSearchBar(),
    );
  }
}
