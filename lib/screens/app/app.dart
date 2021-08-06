import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:opaku/core/constants/themes.dart';
import 'package:opaku/core/repository/authentication/authentication_services.dart';
import 'package:opaku/core/routes/app_route.dart';
import 'package:opaku/logic/app/bloc/app_bloc.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
    required Authentication authentication,
  })  : _authentication = authentication,
        super(key: key);

  final Authentication _authentication;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authentication,
      child: BlocProvider(
        create: (_) => AppBloc(
          authenticationRepository: _authentication,
        ),
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    FirebaseAnalytics analytics = FirebaseAnalytics();
    FirebaseAnalyticsObserver observer = FirebaseAnalyticsObserver(analytics: analytics);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: customTheme,
      navigatorObservers: <NavigatorObserver>[observer],
      home: FlowBuilder<AppStatus>(
        state: context.select((AppBloc bloc) => bloc.state.status),
        onGeneratePages: onGenerateAppViewPages,
      ),
    );
  }
}