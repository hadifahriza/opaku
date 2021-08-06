import 'package:flutter/widgets.dart';
import 'package:opaku/logic/app/bloc/app_bloc.dart';
import 'package:opaku/screens/first_screen/sign_in/sign_in.dart';
import 'package:opaku/screens/main_screen/home/home.dart';

List<Page> onGenerateAppViewPages(AppStatus state, List<Page<dynamic>> pages) {
  switch (state) {
    case AppStatus.authenticated:
      return [Home.page()];
    case AppStatus.unauthenticated:
    default:
      return [SignIn.page()];
  }
}