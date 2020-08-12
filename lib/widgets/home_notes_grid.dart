import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notes_app/model/note.dart';
import 'package:flutter_notes_app/utils/constants.dart';
import 'package:flutter_notes_app/utils/routes/router.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomeNotesGrid extends StatelessWidget {
  final List<Note> notes;

  const HomeNotesGrid({Key key, @required this.notes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      itemCount: notes.length,
      itemBuilder: (context, index) => Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(Size8),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(Size8),
          onTap: () => _goToDetailsNote(context, notes[index]),
          child: Padding(
            padding: const EdgeInsets.all(Size8),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notes[index].title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox.fromSize(size: Size.fromHeight(4)),
                  Expanded(
                    child: Text(
                      notes[index].note,
                      overflow: TextOverflow.fade,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      staggeredTileBuilder: (index) =>
          StaggeredTile.count(2, index.isEven ? 2 : 1),
      mainAxisSpacing: Size8,
      crossAxisSpacing: Size8,
      padding: EdgeInsets.symmetric(
        vertical: Size16,
        horizontal: Size8,
      ),
    );
  }

  _goToDetailsNote(BuildContext context, Note note) {
    Navigator.pushNamed(context, Router.Add_Note, arguments: note);
  }
}
