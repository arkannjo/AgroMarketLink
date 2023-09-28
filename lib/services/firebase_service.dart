// firebase_service.dart

import 'package:firebase_core/firebase_core.dart';

class FirebaseService {
  static Future<void> initializeFirebase() async {
    const firebaseConfig = {
      "apiKey": "AIzaSyCiqYbJomdAVCbugfkZgPUQtUJuHc_UCXM",
      "authDomain": "agromarketlinkfb.firebaseapp.com",
      "databaseURL": "https://agromarketlinkfb-default-rtdb.firebaseio.com",
      "projectId": "agromarketlinkfb",
      "storageBucket": "agromarketlinkfb.appspot.com",
      "messagingSenderId": "335254238099",
      "appId": "1:335254238099:web:e818165c2b564a2b462e66",
      "measurementId": "G-62GDMNW820"
    };

    await Firebase.initializeApp(options: FirebaseOptions(
      apiKey: firebaseConfig['apiKey']!,
      authDomain: firebaseConfig['authDomain']!,
      databaseURL: firebaseConfig['databaseURL']!,
      projectId: firebaseConfig['projectId']!,
      storageBucket: firebaseConfig['storageBucket']!,
      messagingSenderId: firebaseConfig['messagingSenderId']!,
      appId: firebaseConfig['appId']!,
      measurementId: firebaseConfig['measurementId']!,
    ));
  }
}
