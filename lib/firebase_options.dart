// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBoevxPuY1jXK6biMu9LkZmRiEPkaRmQ3c',
    appId: '1:536472439577:web:7734461e0bb8e5acd71388',
    messagingSenderId: '536472439577',
    projectId: 'fruitmate-db-b4a62',
    authDomain: 'fruitmate-db-b4a62.firebaseapp.com',
    storageBucket: 'fruitmate-db-b4a62.appspot.com',
    measurementId: 'G-MMQH6B8LVT',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCrbYoVkvYs1S9FxUwjEB15MrW4-LiNLwA',
    appId: '1:536472439577:android:3ca0c3b2ee99a377d71388',
    messagingSenderId: '536472439577',
    projectId: 'fruitmate-db-b4a62',
    storageBucket: 'fruitmate-db-b4a62.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAi5-2D-S2yq_eG5i9ss_gi7s2zQYjONhU',
    appId: '1:536472439577:ios:615c38c15c328451d71388',
    messagingSenderId: '536472439577',
    projectId: 'fruitmate-db-b4a62',
    storageBucket: 'fruitmate-db-b4a62.appspot.com',
    iosBundleId: 'com.tharushinirmani.fruitmate',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAi5-2D-S2yq_eG5i9ss_gi7s2zQYjONhU',
    appId: '1:536472439577:ios:b6d7f7c516e31ac7d71388',
    messagingSenderId: '536472439577',
    projectId: 'fruitmate-db-b4a62',
    storageBucket: 'fruitmate-db-b4a62.appspot.com',
    iosBundleId: 'com.example.fruitmateApp.RunnerTests',
  );
}