import 'package:flutter/material.dart';
import 'package:flutter_notes_app/utils/routes/router.dart';

class TutorialView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Tutorial View'),
            RaisedButton(
              onPressed: () => _goToHomeView(context),
              child: Text('Enter!'),
            ),
          ],
        ),
      ),
    );
  }

  _goToHomeView(BuildContext context) {
    Navigator.pushNamed(context, Router.Home);
  }
}
