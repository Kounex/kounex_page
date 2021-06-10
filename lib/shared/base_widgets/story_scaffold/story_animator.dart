import 'package:flutter/material.dart';

class StoryAnimator extends StatefulWidget {
  /// 0.0 to 1.0 indicating the progress made for a given scroll offset.
  final double scrollProgress;

  final Widget Function(AnimationController controller) builder;

  const StoryAnimator({
    Key? key,
    required this.scrollProgress,
    required this.builder,
  }) : super(key: key);

  @override
  _StoryAnimatorState createState() => _StoryAnimatorState();
}

class _StoryAnimatorState extends State<StoryAnimator>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    _controller.animateTo(this.widget.scrollProgress, duration: Duration.zero);

    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) => this.widget.builder(_controller),
    );
  }
}
