import 'package:flutter/cupertino.dart';

import 'package:server_notes/presentation/router/app_router.dart';

class App extends StatelessWidget {
  final _route = AppRouter();

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Server Notes',
      onGenerateRoute: _route.onGenerateRoute,
    );
  }
}
