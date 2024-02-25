import 'package:flutter/material.dart';

import 'config/routes/routes.dart';
import 'di/injection_container.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupDependencyInjection(); // Initialize dependency injection
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MailTM',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppRouter.domainList,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
