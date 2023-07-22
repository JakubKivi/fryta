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
    apiKey: 'AIzaSyC_vW4BAIVj2BdljSh3vOEb9LLMa-6jN-c',
    appId: '1:848721073400:web:1e6c5947587c67d194970d',
    messagingSenderId: '848721073400',
    projectId: 'fryta-5b05f',
    authDomain: 'fryta-5b05f.firebaseapp.com',
    storageBucket: 'fryta-5b05f.appspot.com',
    measurementId: 'G-DH05VDJW0E',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBwt-xZXaW-cLScCKw7cXNmjIrT2xZjLUw',
    appId: '1:848721073400:android:d9950418cca771fc94970d',
    messagingSenderId: '848721073400',
    projectId: 'fryta-5b05f',
    storageBucket: 'fryta-5b05f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyANiYYIn0ZCX1JcTdaJgtau_hwhmG5Qhos',
    appId: '1:848721073400:ios:1f0acae2d98a252e94970d',
    messagingSenderId: '848721073400',
    projectId: 'fryta-5b05f',
    storageBucket: 'fryta-5b05f.appspot.com',
    iosClientId: '848721073400-9kg6r7bol14jgb0k1q2g95pvlaqkmkrn.apps.googleusercontent.com',
    iosBundleId: 'com.example.fryta',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyANiYYIn0ZCX1JcTdaJgtau_hwhmG5Qhos',
    appId: '1:848721073400:ios:9860dcf8b15e23e394970d',
    messagingSenderId: '848721073400',
    projectId: 'fryta-5b05f',
    storageBucket: 'fryta-5b05f.appspot.com',
    iosClientId: '848721073400-n6i89dhnosppqopagfh15tbkbnnbs5j8.apps.googleusercontent.com',
    iosBundleId: 'com.example.fryta.RunnerTests',
  );
}