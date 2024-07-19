import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app.dart';
import 'data/repositories/authentication/auth_repository.dart';
import 'firebase_options.dart';

Future<void> main() async {
  // Add Widgets Binding
  final WidgetsBinding widgetsBinding =
  WidgetsFlutterBinding.ensureInitialized();

  //Init Local Storage
  await GetStorage.init();

  //Await Native Splash
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  /// Init Firebase and Authentication
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then(
        (FirebaseApp value)=>Get.put(AuthRepository()),
  );

// Load all the material designs, themes, modes, bindings
  runApp(const App());
}

class FlutterNativeSplash {
}
