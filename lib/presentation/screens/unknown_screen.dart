import 'package:flutter/cupertino.dart';

class UnknownScreen extends StatelessWidget {
  UnknownScreen(this.settings);

  final RouteSettings settings;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: Text(
          'Unknown Screen: ${settings.name}',
        ),
      ),
    );
  }
}
