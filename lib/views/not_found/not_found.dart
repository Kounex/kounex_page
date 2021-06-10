import 'package:flutter/material.dart';

import '../../shared/base_widgets/k_scaffold.dart';

class NotFoundView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return KScaffold(
      content: [
        Text('Nothing here... go please'),
      ],
    );
  }
}
