
import 'package:dart_application_login/pages/home.dart';
import 'package:dart_application_login/routes/myroutes.dart';
import 'package:dart_application_login/pages/log.dart';
import 'package:dart_application_login/pages/inicio.dart';
import 'package:flutter/material.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  MyRoutes.home.name: (context) =>  Home(),
  MyRoutes.login.name: (context) =>  Login(),
  MyRoutes.inicio.name: (context) => const Inicio(),
};