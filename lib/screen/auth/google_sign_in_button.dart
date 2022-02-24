import 'package:dress_up/authentication/google_sign_in.dart';
import 'package:dress_up/controller/user_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class GoogleSignInButton extends StatefulWidget {
  const GoogleSignInButton({Key? key}) : super(key: key);

  @override
  _GoogleSignInButtonState createState() => _GoogleSignInButtonState();
}

class _GoogleSignInButtonState extends State<GoogleSignInButton> {
  final UserController _userController = Get.find();
  bool _isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: _isSigningIn
          ? const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            )
          : OutlinedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
          ),
        ),
        onPressed: () async {
          setState(() {
            _isSigningIn = true;
          });

          User? user = await Authentication.signInWithGoogle();
          setState(() {
            _isSigningIn = false;
          });
          if (user != null) {
                  _userController.addName(
                      user.displayName.toString(), user.photoURL.toString());
                  _userController.google = true;
                  Get.snackbar("Your Google Account verified", "Successfully");
                } else {
                  Get.snackbar("Google account not verified", "Verified First");
                }
              },
        child: Padding(
          padding: const EdgeInsets.all(1),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Image(
                      image: AssetImage("assets/icon/google.png"),
                      height: 35.0,
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text('Verify Google Account',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black54,
                              fontWeight: FontWeight.w600,
                            )))
                  ],
                ),
              ),
            ),
    );
  }
}
