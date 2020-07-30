import 'package:flutter/material.dart';
import 'package:statemanagementsession/utils/decorations/colors.dart';

import 'di.dart';
import 'services/navigation_service.dart';
import 'utils/routing/router.dart';
import 'utils/routing/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'State Management Session',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          color: Colors.transparent,
          elevation: 0.0,
          brightness: Brightness.light,
          iconTheme: IconThemeData(
            color: blue495357,
          ),
        ),
        textTheme: TextTheme(
          headline6: TextStyle(
            color: blue495357,
          ),
          headline5: TextStyle(
            color: blue495357,
            fontSize: 24,
          ),
          headline4: TextStyle(
            fontSize: 18,
          ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      navigatorKey: sl<NavigationService>().navigatorKey,
      initialRoute: products,
      onGenerateRoute: Router.generateRoute,
    );
  }
}
