import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBRorSk6AYHOZmhYCNIixxkJB_FzVVlr24",
            authDomain: "commerce-lkwti4.firebaseapp.com",
            projectId: "commerce-lkwti4",
            storageBucket: "commerce-lkwti4.firebasestorage.app",
            messagingSenderId: "282143900886",
            appId: "1:282143900886:web:2a1e1a648c2206b9cc3577"));
  } else {
    await Firebase.initializeApp();
  }
}
