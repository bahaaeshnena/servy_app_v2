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
    apiKey: 'AIzaSyCVzSzq9cd-WxMDiUMx2eB7wr4pA-UIs0I',
    appId: '1:144020050504:web:4c6543eacf27635e10be7d',
    messagingSenderId: '144020050504',
    projectId: 'servy-app-v2',
    authDomain: 'servy-app-v2.firebaseapp.com',
    storageBucket: 'servy-app-v2.appspot.com',
    measurementId: 'G-5L1BNPX7GN',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAQP6NwpIi1nBbHBBZhceChikC3WAbcc5E',
    appId: '1:144020050504:android:be211cd07b4ac1f210be7d',
    messagingSenderId: '144020050504',
    projectId: 'servy-app-v2',
    storageBucket: 'servy-app-v2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBTym1e5KyUBgmMS5WQ8FJ1MRFYj9UT6A0',
    appId: '1:144020050504:ios:aa0922d185faf21410be7d',
    messagingSenderId: '144020050504',
    projectId: 'servy-app-v2',
    storageBucket: 'servy-app-v2.appspot.com',
    iosBundleId: 'com.example.servyApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBTym1e5KyUBgmMS5WQ8FJ1MRFYj9UT6A0',
    appId: '1:144020050504:ios:e1ac8659bae001fb10be7d',
    messagingSenderId: '144020050504',
    projectId: 'servy-app-v2',
    storageBucket: 'servy-app-v2.appspot.com',
    iosBundleId: 'com.example.servyApp.RunnerTests',
  );
}
