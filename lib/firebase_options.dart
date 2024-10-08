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
    apiKey: 'AIzaSyDkXqG4ix1lKs1Ght-kdwCdQwDb7Qx8x00',
    appId: '1:334403602876:web:4d1dae84a5250f32c403b9',
    messagingSenderId: '334403602876',
    projectId: 'moufu-8e50f',
    authDomain: 'moufu-8e50f.firebaseapp.com',
    storageBucket: 'moufu-8e50f.appspot.com',
    measurementId: 'G-KMPW398VT4',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDuGRvBs-K6yUG01I5cTRKCOzQVCtvNHhw',
    appId: '1:334403602876:android:04b793a1003512cbc403b9',
    messagingSenderId: '334403602876',
    projectId: 'moufu-8e50f',
    storageBucket: 'moufu-8e50f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAG8NNfKd9c5PE9f9ZxOnxKVEB1Nq9BkZc',
    appId: '1:334403602876:ios:f7c4ed16cca320d3c403b9',
    messagingSenderId: '334403602876',
    projectId: 'moufu-8e50f',
    storageBucket: 'moufu-8e50f.appspot.com',
    iosBundleId: 'com.midori.moufu',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAG8NNfKd9c5PE9f9ZxOnxKVEB1Nq9BkZc',
    appId: '1:334403602876:ios:f7c4ed16cca320d3c403b9',
    messagingSenderId: '334403602876',
    projectId: 'moufu-8e50f',
    storageBucket: 'moufu-8e50f.appspot.com',
    iosBundleId: 'com.midori.moufu',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDkXqG4ix1lKs1Ght-kdwCdQwDb7Qx8x00',
    appId: '1:334403602876:web:d0ffb4898ab2bf1ac403b9',
    messagingSenderId: '334403602876',
    projectId: 'moufu-8e50f',
    authDomain: 'moufu-8e50f.firebaseapp.com',
    storageBucket: 'moufu-8e50f.appspot.com',
    measurementId: 'G-C5KC033BWD',
  );

}