import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/repository/authentication/authentication_services.dart';
import 'logic/bloc_observer.dart';
import 'screens/app/app.dart';

Future<void> main() async {
  Bloc.observer = AppBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final authentication = Authentication();
  await authentication.user.first;
  runApp(App(authentication: authentication));
}