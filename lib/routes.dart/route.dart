
import 'package:dart_application_auntentication1/pages/home.dart';
import 'package:dart_application_auntentication1/routes/myroutes.dart';
import 'package:dart_application_auntentication1/pages/log.dart';
import 'package:dart_application_auntentication1/pages/inicio.dart';
import 'package:flutter/material.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  MyRoutes.home.name: (context) =>  Home(),
  MyRoutes.login.name: (context) =>  Login(),
  MyRoutes.inicio.name: (context) => const Inicio(),
};