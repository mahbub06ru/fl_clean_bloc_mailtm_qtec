import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import 'config/routes/routes.dart';
import 'core/app/app.dart';
import 'core/observer/bloc_observer.dart';
import 'di/di.dart' as di;
/*void main() {
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
}*/

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await GetStorage.init();

  await di.init();

  Bloc.observer = MyBlocObserver();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(Phoenix(child: const MyApp()));
}


