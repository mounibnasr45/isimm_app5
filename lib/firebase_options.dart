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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for android - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDfq4wPtPVW0N97FYuJlaTGcZxKF5ReaVg',
    appId: '1:868791282676:web:eca3e2e4ecac3cc7a267a1',
    messagingSenderId: '868791282676',
    projectId: 'fir-isimmapp',
    authDomain: 'fir-isimmapp.firebaseapp.com',
    storageBucket: 'fir-isimmapp.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDBagJ2u0v2FTKTCiP_kesGxFJ2ph3aWbI',
    appId: '1:868791282676:ios:d38c9f01e45a2a8aa267a1',
    messagingSenderId: '868791282676',
    projectId: 'fir-isimmapp',
    storageBucket: 'fir-isimmapp.appspot.com',
    iosBundleId: 'com.example.isimmApp5',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDBagJ2u0v2FTKTCiP_kesGxFJ2ph3aWbI',
    appId: '1:868791282676:ios:35345fbd5e2a4d54a267a1',
    messagingSenderId: '868791282676',
    projectId: 'fir-isimmapp',
    storageBucket: 'fir-isimmapp.appspot.com',
    iosBundleId: 'com.example.isimmApp5.RunnerTests',
  );
}
