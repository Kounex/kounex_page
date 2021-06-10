import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  final AnimationController controller;

  const Header({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  late Animation<double> _opacity;
  late Animation<double> _translation;

  @override
  void initState() {
    super.initState();

    _opacity = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(
          begin: 1.0,
          end: 1.0,
        ),
        weight: 60.0,
      ),
      TweenSequenceItem(
        tween: Tween(
          begin: 1.0,
          end: 0.0,
        ),
        weight: 40.0,
      ),
    ]).animate(this.widget.controller);

    _translation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(
          begin: 0.0,
          end: 0.0,
        ),
        weight: 60.0,
      ),
      TweenSequenceItem(
        tween: Tween(
          begin: 0.0,
          end: -20.0,
        ),
        weight: 40.0,
      ),
    ]).animate(this.widget.controller);
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _opacity.value,
      child: Transform.translate(
        offset: Offset(0.0, _translation.value),
        child: Row(
          children: [
            Image.network(
                'https://avatars.githubusercontent.com/u/13067046?v=4'),
            Text('Kounex'),
          ],
        ),
      ),
    );
  }
}
