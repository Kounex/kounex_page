import 'package:flutter/material.dart';

import '../../router/app_router_delegate.dart';
import '../../router/locations.dart';
import '../../shared/base_widgets/k_scaffold.dart';

class ImprintView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return KScaffold(
      content: [
        Text('Imprint'),
        ElevatedButton(
          onPressed: () => AppRouterDelegate.of(context)
              .routeTo(ImprintLocation.detail.route),
          child: Text(
            'Detail',
          ),
        ),
      ],
    );
  }
}
