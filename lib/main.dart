import 'package:flutter/cupertino.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:server_notes/presentation/app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(App());
}
