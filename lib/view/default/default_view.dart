import 'package:flutter/material.dart';

class DefaultView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ups!...'),
      ),
      body: Center(
        child: const Text('Nothing to show here'),
      ),
    );
  }
}
