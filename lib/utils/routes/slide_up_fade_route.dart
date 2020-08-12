import 'package:flutter/material.dart';

class SlideUpFadeRoute extends PageRouteBuilder {
  final Widget widget;
  final RouteSettings settings;

  SlideUpFadeRoute({this.settings, this.widget})
      : super(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) {
            return widget;
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var beginOffset = Offset(0.0, 1.0);
            var endOffset = Offset.zero;
            var curve = Curves.ease;
            var tween = Tween(begin: beginOffset, end: endOffset)
                .chain(CurveTween(curve: curve));
            var fadeTween = Tween(begin: 0.0, end: 1.0);
            var curvedAnimation =
                CurvedAnimation(parent: animation, curve: curve);

            return SlideTransition(
              position: animation.drive(tween),
              child: FadeTransition(
                opacity: fadeTween.animate(curvedAnimation),
                child: child,
              ),
            );
          },
        );
}
