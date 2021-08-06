import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsService {
  static FirebaseAnalytics _analytics = FirebaseAnalytics();
  
  Future<void> sendLogEvent({
    required String name,
    required String location,
  }) async {
    await _analytics.logEvent(
      name: name,
      parameters: <String, dynamic>{
        "name": name,
        "location": location,
        // "eventTime": Timestamp.fromDate(DateTime.now()),
      }
    );
  }

  Future<void> sendLogSignIn({required String signInMethod}) async {
    await _analytics.logLogin(
      loginMethod: signInMethod
    );
  }

  Future<void> sendLogSignUp({required String signUpMethod}) async {
    await _analytics.logSignUp(
      signUpMethod: signUpMethod,
    );
  }

  Future<void> setUserId({required String id}) async {
    await _analytics.setUserId(id);
  }
}