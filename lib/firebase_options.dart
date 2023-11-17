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
    apiKey: 'AIzaSyBeYYya0mD8lELRT9TbWAdBDhqzgfQK5wc',
    appId: '1:1098481239611:web:61fb6408a5315a80acfe1e',
    messagingSenderId: '1098481239611',
    projectId: 'contact-app-2ad81',
    authDomain: 'contact-app-2ad81.firebaseapp.com',
    storageBucket: 'contact-app-2ad81.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAKnWm_HObe64kKKiTPjKw0R_aj1FrPWcg',
    appId: '1:1098481239611:android:74410dfffc4008aaacfe1e',
    messagingSenderId: '1098481239611',
    projectId: 'contact-app-2ad81',
    storageBucket: 'contact-app-2ad81.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAWej8XzAO-8z0RDL7stT5GUV5CB30ugaA',
    appId: '1:1098481239611:ios:b40b74a48e0e0664acfe1e',
    messagingSenderId: '1098481239611',
    projectId: 'contact-app-2ad81',
    storageBucket: 'contact-app-2ad81.appspot.com',
    iosBundleId: 'com.example.contactApp1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAWej8XzAO-8z0RDL7stT5GUV5CB30ugaA',
    appId: '1:1098481239611:ios:afaae5a0559168ceacfe1e',
    messagingSenderId: '1098481239611',
    projectId: 'contact-app-2ad81',
    storageBucket: 'contact-app-2ad81.appspot.com',
    iosBundleId: 'com.example.contactApp1.RunnerTests',
  );
}