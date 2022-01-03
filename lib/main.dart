import 'package:flutter/cupertino.dart';
import 'package:flutter_architecture_test/src/core/app.dart';
import 'package:flutter_architecture_test/src/core/di/di.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupDependencyInjection();
  runApp(const App());
}
