import 'package:flutter/material.dart';

class KScaffold extends StatelessWidget {
  final List<Widget> content;
  final double? contentExtent;

  final ScrollController? contentController;

  KScaffold({
    required this.content,
    this.contentExtent,
    this.contentController,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          controller: this.contentController,
          itemCount: this.content.length,
          itemExtent: this.contentExtent,
          itemBuilder: (context, index) => this.content[index],
        ),
      ),
    );
  }
}
