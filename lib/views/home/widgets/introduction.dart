import 'package:flutter/material.dart';

class Introduction extends StatefulWidget {
  final AnimationController controller;

  const Introduction({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  _IntroductionState createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  late Animation<double> _opacity;
  late Animation<double> _translation;

  @override
  void initState() {
    super.initState();

    _opacity = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(
          begin: 0.0,
          end: 1.0,
        ),
        weight: 30.0,
      ),
      TweenSequenceItem(
        tween: Tween(
          begin: 1.0,
          end: 1.0,
        ),
        weight: 40.0,
      ),
      TweenSequenceItem(
        tween: Tween(
          begin: 1.0,
          end: 0.0,
        ),
        weight: 30.0,
      ),
    ]).animate(this.widget.controller);

    _translation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(
          begin: 20.0,
          end: 0.0,
        ),
        weight: 30.0,
      ),
      TweenSequenceItem(
        tween: Tween(
          begin: 1.0,
          end: 0.0,
        ),
        weight: 40.0,
      ),
      TweenSequenceItem(
        tween: Tween(
          begin: 0.0,
          end: -20.0,
        ),
        weight: 30.0,
      ),
    ]).animate(this.widget.controller);
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _opacity.value,
      child: Transform.translate(
        offset: Offset(0.0, _translation.value),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Kounex'),
            Text('LOL'),
          ],
        ),
      ),
    );
  }
}
