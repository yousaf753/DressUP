import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthenticationHelper {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  get user => _firebaseAuth.currentUser;
  Future<bool> signUp({required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } on FirebaseAuthException catch (exception) {
      if (exception.code == 'weak-password') {
        Get.snackbar('Failed', 'The password provided is too weak.',duration: const Duration(seconds: 2),snackPosition: SnackPosition.BOTTOM);
      } else if (exception.code == 'email-already-in-use') {
        Get.snackbar('Successful', 'But The account already exists for that email.',duration: const Duration(seconds: 2),snackPosition: SnackPosition.BOTTOM);
      }
      else if (exception.code == 'user-not-found'){
        Get.snackbar('Failed', 'user-not-found',duration: const Duration(seconds: 2),snackPosition: SnackPosition.BOTTOM);
      }
      return false;
    }
    catch (exception) {
      Get.snackbar('Exception', '$exception',duration: const Duration(seconds: 2),snackPosition: SnackPosition.BOTTOM);
      return false;
    }
  }

  Future<bool> signIn({required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (exception) {
      if (exception.code == 'user-not-found') {
        Get.snackbar('Failed', 'No user found for that email.',duration: const Duration(seconds: 2),snackPosition: SnackPosition.BOTTOM);
      }
      else if (exception.code == 'wrong-password') {
        Get.snackbar('Failed', 'wrong-password',duration: const Duration(seconds: 2),snackPosition: SnackPosition.BOTTOM);
      }
      return false;
    }
    catch (exception) {
      Get.snackbar('Exception', '$exception',duration: const Duration(seconds: 2),snackPosition: SnackPosition.BOTTOM);
      return false;
    }
  }

  Future signOut() async {
    try {
      await _firebaseAuth.signOut();
      return "Signed out";
    } on FirebaseAuthException catch(e) {
      return e.message;
    }
    catch (exception) {
      Get.snackbar('Exception', '$exception',duration: const Duration(seconds: 2),snackPosition: SnackPosition.BOTTOM);
    }
  }
  Future deleteUser() async {
    try {
      await _firebaseAuth.currentUser!.delete();
      return "Signed out";
    } on FirebaseAuthException catch(e) {
      return e.message;
    }
    catch (exception) {
      Get.snackbar('Exception', '$exception',duration: const Duration(seconds: 2),snackPosition: SnackPosition.BOTTOM);
    }
  }
  Future resetUserPassword (String email) async{
    try{
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      Get.snackbar("Wait", "Password reset Email Sent",duration: const Duration(seconds: 2),snackPosition: SnackPosition.BOTTOM);
    }
    catch (exception) {
      Get.snackbar("Failed", exception.toString(),duration: const Duration(seconds: 2),snackPosition: SnackPosition.BOTTOM);
    }
  }

}