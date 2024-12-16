import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return webOptions;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return androidOptions;
      case TargetPlatform.iOS:
        return iosOptions;
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

  static const FirebaseOptions webOptions = FirebaseOptions(
      apiKey: "AIzaSyCazkybKsgC8T3ehDcdaOSjvUajbhsX7qw",
      authDomain: "post-ace.firebaseapp.com", 
      databaseURL: "https://post-ace-default-rtdb.firebaseio.com",
      projectId: "post-ace",
      storageBucket: "post-ace.firebasestorage.app",
      messagingSenderId: "361249630346",
      appId: "1:361249630346:web:6cfef490f827752122e573",
      measurementId: "G-NVSZE2HTRJ");

  static const FirebaseOptions androidOptions = FirebaseOptions(
    apiKey: 'AIzaSyCazkybKsgC8T3ehDcdaOSjvUajbhsX7qw',
    appId: '1:361249630346:android:6cfef490f827752122e573',
    messagingSenderId: '361249630346',
    projectId: 'post-ace',
    databaseURL: 'https://post-ace-default-rtdb.firebaseio.com',
    storageBucket: 'post-ace.firebasestorage.app',
  );

  static const FirebaseOptions iosOptions = FirebaseOptions(
    apiKey: 'AIzaSyCazkybKsgC8T3ehDcdaOSjvUajbhsX7qw',
    appId: '1:361249630346:ios:6cfef490f827752122e573',
    messagingSenderId: '361249630346',
    projectId: 'post-ace',
    databaseURL: 'https://post-ace-default-rtdb.firebaseio.com',
    storageBucket: 'post-ace.firebasestorage.app',
    iosClientId: '361249630346-xxxxx.apps.googleusercontent.com',
    iosBundleId: 'com.example.postAce',
  );
}
