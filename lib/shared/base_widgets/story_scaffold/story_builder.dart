import 'package:flutter/material.dart';
import 'package:kounex_page/shared/base_widgets/story_scaffold/story_animator.dart';

import 'story_scaffold.dart';

class StoryBuilder extends StatefulWidget {
  final Story story;
  final double prevAccOffset;

  const StoryBuilder({
    Key? key,
    required this.story,
    required this.prevAccOffset,
  }) : super(key: key);

  @override
  _StoryBuilderState createState() => _StoryBuilderState();
}

class _StoryBuilderState extends State<StoryBuilder> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ScrollExposer.of(context).controller.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    double storyOffset =
        ScrollExposer.of(context).controller.offset - this.widget.prevAccOffset;

    return Offstage(
      offstage: storyOffset < 0,
      child: StoryAnimator(
        scrollProgress: storyOffset / this.widget.story.offsetToScroll,
        builder: this.widget.story.builder,
      ),
    );
  }
}
