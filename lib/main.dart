import 'package:dart_application_login/routes/myroutes.dart';
import 'package:dart_application_login/routes/route.dart';
import 'package:dart_application_login/routes.dart/myroutes.dart';
import 'package:dart_application_login/routes.dart/route.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'slayer',
      initialRoute: MyRoutes.home.name,
      routes: routes,
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => PageNotFound(name: settings.name),
        );
      },
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black, 
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.red),
          bodyText2: TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}

class PageNotFound extends StatelessWidget {
  const PageNotFound({Key? key, required this.name}) : super(key: key);
  final String? name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'La ruta $name no se encuentra',
              style: TextStyle(color: Colors.red),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, MyRoutes.home.name);
              },
              child: const Text('regresar'),
            ),
          ],
        ),
      ),
    );
  }
}