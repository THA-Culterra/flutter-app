// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
    apiKey: 'AIzaSyDz_S3DPix1kjHyX99jpbomeTxBH3xgR9o',
    appId: '1:136717555743:web:104b01b2a59ce4174cdd2a',
    messagingSenderId: '136717555743',
    projectId: 'tha-culterra',
    authDomain: 'tha-culterra.firebaseapp.com',
    storageBucket: 'tha-culterra.firebasestorage.app',
    measurementId: 'G-TL208WXRT1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCW_kMmaOjm9p9Mw8PA8YQ_AIMQbrcG9Ho',
    appId: '1:136717555743:android:01d066af61ba67284cdd2a',
    messagingSenderId: '136717555743',
    projectId: 'tha-culterra',
    storageBucket: 'tha-culterra.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDDxn9O6W8bYZUSfD8OtRueA9RINTNG9Sc',
    appId: '1:136717555743:ios:fa563db542614dd34cdd2a',
    messagingSenderId: '136717555743',
    projectId: 'tha-culterra',
    storageBucket: 'tha-culterra.firebasestorage.app',
    iosClientId: '136717555743-ag4dm7g1gvahr9tdtljqbh2gjqcrmujr.apps.googleusercontent.com',
    iosBundleId: 'com.tha.culterra',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDDxn9O6W8bYZUSfD8OtRueA9RINTNG9Sc',
    appId: '1:136717555743:ios:fa563db542614dd34cdd2a',
    messagingSenderId: '136717555743',
    projectId: 'tha-culterra',
    storageBucket: 'tha-culterra.firebasestorage.app',
    iosClientId: '136717555743-ag4dm7g1gvahr9tdtljqbh2gjqcrmujr.apps.googleusercontent.com',
    iosBundleId: 'com.tha.culterra',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDz_S3DPix1kjHyX99jpbomeTxBH3xgR9o',
    appId: '1:136717555743:web:da61ed943e8cc5ef4cdd2a',
    messagingSenderId: '136717555743',
    projectId: 'tha-culterra',
    authDomain: 'tha-culterra.firebaseapp.com',
    storageBucket: 'tha-culterra.firebasestorage.app',
    measurementId: 'G-5GLNYNB442',
  );

}