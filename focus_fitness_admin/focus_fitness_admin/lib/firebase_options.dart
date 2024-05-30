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
        return windows;
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
    apiKey: 'AIzaSyA2EPh0ZQdVCkrO2MOtFIsL5ApGX2--8nY',
    appId: '1:649487348373:web:8e774574f5b5ee3e6ca19c',
    messagingSenderId: '649487348373',
    projectId: 'focus-fitness-11860',
    authDomain: 'focus-fitness-11860.firebaseapp.com',
    storageBucket: 'focus-fitness-11860.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCfdGX1RcSGU0xiseTRVu_koYqHYP_hmrM',
    appId: '1:649487348373:android:4bd7f2576ffd8ca26ca19c',
    messagingSenderId: '649487348373',
    projectId: 'focus-fitness-11860',
    storageBucket: 'focus-fitness-11860.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBfthzaD5EfNVdmunCMqK1BMntd3U8U3bo',
    appId: '1:649487348373:ios:54016a11508546c76ca19c',
    messagingSenderId: '649487348373',
    projectId: 'focus-fitness-11860',
    storageBucket: 'focus-fitness-11860.appspot.com',
    iosBundleId: 'com.example.focusFitnesss',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBfthzaD5EfNVdmunCMqK1BMntd3U8U3bo',
    appId: '1:649487348373:ios:54016a11508546c76ca19c',
    messagingSenderId: '649487348373',
    projectId: 'focus-fitness-11860',
    storageBucket: 'focus-fitness-11860.appspot.com',
    iosBundleId: 'com.example.focusFitnesss',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA2EPh0ZQdVCkrO2MOtFIsL5ApGX2--8nY',
    appId: '1:649487348373:web:61be01d4acf1335a6ca19c',
    messagingSenderId: '649487348373',
    projectId: 'focus-fitness-11860',
    authDomain: 'focus-fitness-11860.firebaseapp.com',
    storageBucket: 'focus-fitness-11860.appspot.com',
  );

}