import 'package:flutter/material.dart';
import 'package:flutter_notes_app/utils/constants.dart';

class AddNoteInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: Theme.of(context).textTheme.bodyText2,
        children: [
          TextSpan(text: 'Press'),
          WidgetSpan(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: Size2),
              child: Icon(
                Icons.add,
                size: Size16,
                color: Colors.black54,
              ),
            ),
          ),
          TextSpan(text: 'to add one')
        ],
      ),
    );
  }
}
