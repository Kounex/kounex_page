import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../shared/base_widgets/story_scaffold/story_scaffold.dart';
import 'widgets/header.dart';
import 'widgets/introduction.dart';

class ScrollExposer extends InheritedWidget {
  final ScrollController controller = ScrollController();

  ScrollExposer({required Widget child}) : super(child: child);

  static ScrollExposer of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<ScrollExposer>()!;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoryScaffold(
      stories: [
        Story(
          builder: (controller) => Header(controller: controller),
          offsetToScroll: 500.0,
        ),
        Story(
          builder: (controller) => Introduction(controller: controller),
          offsetToScroll: 1000.0,
        ),
      ],
    );
  }
}
