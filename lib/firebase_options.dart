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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCv9N7A3mb4To2z8m33HWu4nry52q2q4R8',
    appId: '1:270969424459:android:8d362344969c4e47091bce',
    messagingSenderId: '270969424459',
    projectId: 'kasir-super-cfa8d',
    storageBucket: 'kasir-super-cfa8d.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDld4irdVGWC5P13qGc-1l9Loz6UGgqA_U',
    appId: '1:270969424459:ios:7dd7e14fc0676b65091bce',
    messagingSenderId: '270969424459',
    projectId: 'kasir-super-cfa8d',
    storageBucket: 'kasir-super-cfa8d.firebasestorage.app',
    iosBundleId: 'com.example.kelompoktwoo',
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAUgtfPCPhRE_UA1MLayxHh5AqzoBZ11Dc',
    appId: '1:270969424459:web:9136d07635cc9090091bce',
    messagingSenderId: '270969424459',
    projectId: 'kasir-super-cfa8d',
    authDomain: 'kasir-super-cfa8d.firebaseapp.com',
    storageBucket: 'kasir-super-cfa8d.firebasestorage.app',
    measurementId: 'G-LRY52CTHFR',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDld4irdVGWC5P13qGc-1l9Loz6UGgqA_U',
    appId: '1:270969424459:ios:7dd7e14fc0676b65091bce',
    messagingSenderId: '270969424459',
    projectId: 'kasir-super-cfa8d',
    storageBucket: 'kasir-super-cfa8d.firebasestorage.app',
    iosBundleId: 'com.example.kelompoktwoo',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAUgtfPCPhRE_UA1MLayxHh5AqzoBZ11Dc',
    appId: '1:270969424459:web:9c1a8b10d8b37efb091bce',
    messagingSenderId: '270969424459',
    projectId: 'kasir-super-cfa8d',
    authDomain: 'kasir-super-cfa8d.firebaseapp.com',
    storageBucket: 'kasir-super-cfa8d.firebasestorage.app',
    measurementId: 'G-R7XZT3766C',
  );

}