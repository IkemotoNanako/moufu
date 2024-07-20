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
    apiKey: 'AIzaSyDM2Jg8-mbzqmy44zCEmzWjkvGQ7LXt6ks',
    appId: '1:341711922368:web:699ce26ef0879d07ca7925',
    messagingSenderId: '341711922368',
    projectId: 'moufu-dd365',
    authDomain: 'moufu-dd365.firebaseapp.com',
    storageBucket: 'moufu-dd365.appspot.com',
    measurementId: 'G-KQMTZ0DGDV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAsfz770wlLwgO707TRqDYkFMtTKtUU_LQ',
    appId: '1:341711922368:android:2fe4ed018b1e3e22ca7925',
    messagingSenderId: '341711922368',
    projectId: 'moufu-dd365',
    storageBucket: 'moufu-dd365.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCWLFr9dNGiiV_6H9gwbq3Lqip4fB9lSjo',
    appId: '1:341711922368:ios:6bf522c64f5c1ff6ca7925',
    messagingSenderId: '341711922368',
    projectId: 'moufu-dd365',
    storageBucket: 'moufu-dd365.appspot.com',
    iosBundleId: 'com.midori.moufu',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCWLFr9dNGiiV_6H9gwbq3Lqip4fB9lSjo',
    appId: '1:341711922368:ios:6bf522c64f5c1ff6ca7925',
    messagingSenderId: '341711922368',
    projectId: 'moufu-dd365',
    storageBucket: 'moufu-dd365.appspot.com',
    iosBundleId: 'com.midori.moufu',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDM2Jg8-mbzqmy44zCEmzWjkvGQ7LXt6ks',
    appId: '1:341711922368:web:cb9d63553be5ecc3ca7925',
    messagingSenderId: '341711922368',
    projectId: 'moufu-dd365',
    authDomain: 'moufu-dd365.firebaseapp.com',
    storageBucket: 'moufu-dd365.appspot.com',
    measurementId: 'G-4PZE4SM7D4',
  );
}
