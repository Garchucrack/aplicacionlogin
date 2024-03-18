
import 'package:dart_application_login/pages.dart/home.dart';
import 'package:dart_application_login/pages.dart/inicio.dart';
import 'package:dart_application_login/pages.dart/log.dart';

import 'package:dart_application_login/routes.dart/myroutes.dart';



import 'package:flutter/material.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  MyRoutes.home.name: (context) =>  Home(),
  MyRoutes.login.name: (context) =>  Login(),
  MyRoutes.inicio.name: (context) => const Inicio(),
};