
import 'package:bimak/bottom_navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../features/authentication/screens/login/login.dart';
import '../../../features/authentication/screens/onboarding/onboarding.dart';
import '../../../features/authentication/screens/signup/verify_email.dart';
import '../../../utils/exceptions/firebase_auth_exception.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class AuthRepository extends GetxController {
  static AuthRepository get instance => Get.find();

  /// Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  ///Called from main.dart
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  ///Function to show Relevant Screen
  screenRedirect() async {
    final user = _auth.currentUser;

    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => const BottomNavigationMenu());
      } else {
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    } else {
      ///Local Storage
      deviceStorage.writeIfNull('isFirstTime', true);
      deviceStorage.read('isFirstTime') != true
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(() => const OnBoardingScreen());
    }
  }

  /*-----------Email and Password sign-in--------*/

  ///[EmailAuthentication]-Login
  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw MFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw MFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const MFormatException();
    } on PlatformException catch (e) {
      throw MPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Champ. Please try again';
    }
  }

  ///[EmailAuthentication]-Register
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw MFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw MFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const MFormatException();
    } on PlatformException catch (e) {
      throw MPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Champ. Please try again';
    }
  }

  ///[EmailVerification]-Mail verification
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw MFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw MFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const MFormatException();
    } on PlatformException catch (e) {
      throw MPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Champ. Please try again';
    }
  }


  ///[EmailAuthentication]-Forget Password
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw MFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw MFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const MFormatException();
    } on PlatformException catch (e) {
      throw MPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Champ. Please try again';
    }
  }

  /*------------federated identity and Social SignIn---------------*/

  ///[GoogleAuthentication]-GOOGLE
  Future<UserCredential?> signInWithGoogle() async {
    try {
      //Trigger the authentication flow
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      //Obtain the authentication details from the request
      final GoogleSignInAuthentication? googleAuth =
          await userAccount?.authentication;

      //Create a new credential
      final credentials = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the user credentials
      return await _auth.signInWithCredential(credentials);

    } on FirebaseAuthException catch (e) {
      throw MFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw MFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const MFormatException();
    } on PlatformException catch (e) {
      throw MPlatformException(e.code).message;
    } catch (e) {
      if (kDebugMode) print('Something went wrong, Champ: $e');
      return null;
    }
  }

  ///[facebook Authentication]-FACEBOOK

  /*--------------./end Federated Identity and social signIn-----------------*/

  ///[LogoutUser]- for any authentication
  Future<void> logout() async {
    try {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw MFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw MFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const MFormatException();
    } on PlatformException catch (e) {
      throw MPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Champ. Please try again';
    }
  }

  ///[DeleteUser]- Remove user Auth and Firebase account
}
