import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../router/app_router_delegate.dart';
import '../../router/locations.dart';
import '../../shared/base_widgets/k_scaffold.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return KScaffold(
      body: Column(
        children: [
          Text('Home'),
          ElevatedButton(
            onPressed: () => AppRouterDelegate.of(context)
                .routeTo(AppLocation.imprint.route),
            child: Text('Imprint'),
          ),
        ],
      ),
    );
  }
}
