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
    apiKey: 'AIzaSyC_PEYujh0N8STIRFyjuwQaofrHHZvf9fs',
    appId: '1:133617459544:web:65727b29fec456da7cc52d',
    messagingSenderId: '133617459544',
    projectId: 'smartcare-93645',
    authDomain: 'smartcare-93645.firebaseapp.com',
    databaseURL: 'https://smartcare-93645-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'smartcare-93645.appspot.com',
    measurementId: 'G-N6E10DLXHS',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB_jTTGNFwZ0NxMb14NE3XV4rICdq1eSaw',
    appId: '1:133617459544:android:21b730872c4940b67cc52d',
    messagingSenderId: '133617459544',
    projectId: 'smartcare-93645',
    databaseURL: 'https://smartcare-93645-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'smartcare-93645.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAPggmv6ZR1IIN-oUuHbb3MNw0WYFJiZIU',
    appId: '1:133617459544:ios:2bae41e5060153627cc52d',
    messagingSenderId: '133617459544',
    projectId: 'smartcare-93645',
    databaseURL: 'https://smartcare-93645-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'smartcare-93645.appspot.com',
    iosClientId: '133617459544-ka3028t6ipjbi4eojlgmecmcnnqaee7d.apps.googleusercontent.com',
    iosBundleId: 'com.example.smartcare.smartCare',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAPggmv6ZR1IIN-oUuHbb3MNw0WYFJiZIU',
    appId: '1:133617459544:ios:2bae41e5060153627cc52d',
    messagingSenderId: '133617459544',
    projectId: 'smartcare-93645',
    databaseURL: 'https://smartcare-93645-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'smartcare-93645.appspot.com',
    iosClientId: '133617459544-ka3028t6ipjbi4eojlgmecmcnnqaee7d.apps.googleusercontent.com',
    iosBundleId: 'com.example.smartcare.smartCare',
  );
}