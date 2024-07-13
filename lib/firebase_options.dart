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
    apiKey: 'AIzaSyCR_qPyenh0ukdaneIBSl2EDCgiaH8J0Wo',
    appId: '1:431955928756:web:0562f128bcf26b057999e1',
    messagingSenderId: '431955928756',
    projectId: 'docteur-59001',
    authDomain: 'docteur-59001.firebaseapp.com',
    storageBucket: 'docteur-59001.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDqBTDeTVMouzvpFd9Y2L2WgDUBQs69pPA',
    appId: '1:431955928756:android:586a82d8ad7de1197999e1',
    messagingSenderId: '431955928756',
    projectId: 'docteur-59001',
    storageBucket: 'docteur-59001.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBNVWufTNTZrB-6LyTMTTkxuHL6ulKzDls',
    appId: '1:431955928756:ios:6fcc7252a3710e437999e1',
    messagingSenderId: '431955928756',
    projectId: 'docteur-59001',
    storageBucket: 'docteur-59001.appspot.com',
    iosBundleId: 'com.example.doctor',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBNVWufTNTZrB-6LyTMTTkxuHL6ulKzDls',
    appId: '1:431955928756:ios:eef4919d026c485c7999e1',
    messagingSenderId: '431955928756',
    projectId: 'docteur-59001',
    storageBucket: 'docteur-59001.appspot.com',
    iosBundleId: 'com.example.doctor.RunnerTests',
  );
}