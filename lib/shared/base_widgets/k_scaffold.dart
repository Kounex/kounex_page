import 'package:flutter/material.dart';

class KScaffold extends StatelessWidget {
  final Widget body;

  KScaffold({required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: this.body),
    );
  }
}
