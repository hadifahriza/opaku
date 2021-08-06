import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserService {
  static FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  static saveUser(User? user) async {
    Map<String, dynamic> userData = {
      "name": user!.displayName,
      "email": user.email,
      "last_login": Timestamp.fromDate(DateTime.now()),
      "created_at": Timestamp.fromDate(DateTime.now()),
    };

    final userRef = _firebaseFirestore.collection("users").doc(user.uid);
    if ((await userRef.get()).exists) {
      await userRef.update({
        "last_login": user.metadata.lastSignInTime!.millisecondsSinceEpoch,
      });
    } else {
      await _firebaseFirestore.collection("users").doc(user.uid).set(userData);
    }
  }
}