import 'package:flutter/material.dart';
import 'package:kounex_page/shared/base_widgets/story_scaffold/story_builder.dart';

import '../k_scaffold.dart';
import '../../../types/extensions/list.dart';

class ScrollExposer extends InheritedWidget {
  final ScrollController controller = ScrollController();

  ScrollExposer({required Widget child}) : super(child: child);

  static ScrollExposer of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<ScrollExposer>()!;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}

class Story {
  final Widget Function(AnimationController controller) builder;
  final double offsetToScroll;

  Story({
    required this.builder,
    required this.offsetToScroll,
  });
}

class StoryScaffold extends StatefulWidget {
  final List<Story> stories;

  const StoryScaffold({
    Key? key,
    required this.stories,
  }) : super(key: key);

  @override
  _StoryScaffoldState createState() => _StoryScaffoldState();
}

class _StoryScaffoldState extends State<StoryScaffold>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));

    _opacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(curve: Curves.easeIn, parent: _controller),
    );

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return ScrollExposer(
      child: Builder(
        builder: (context) => Material(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) => FadeTransition(
              opacity: _opacity,
              child: child,
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                KScaffold(
                  contentController: ScrollExposer.of(context).controller,
                  content: [
                    SizedBox(height: MediaQuery.of(context).size.height),
                    ...List.from(
                      this.widget.stories.map(
                            (story) => SizedBox(
                              height: story.offsetToScroll,
                            ),
                          ),
                    ),
                  ],
                ),
                ...this.widget.stories.mapIndexed(
                      (story, index) => StoryBuilder(
                        story: story,
                        prevAccOffset: index < 1
                            ? 0
                            : this
                                .widget
                                .stories
                                .take(index)
                                .map((story) => story.offsetToScroll)
                                .reduce((curr, next) => curr + next),
                      ),
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
