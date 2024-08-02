import 'package:flutter/material.dart';
import 'package:maya_test/di.dart';
import 'package:maya_test/route_register.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setUp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'MAYA',
      theme: ThemeData(
        useMaterial3: true,
      ),
      routerConfig: RouteRegister().router,
    );
  }
}
