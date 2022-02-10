import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:shedistrict/models/user.dart';
import 'package:shedistrict/ui/routes/routes.gr.dart';
import 'package:shedistrict/utlis/constants/constants.dart';

part 'auth_store.g.dart';
class AuthStore = AuthStoreBase with _$AuthStore;

abstract class AuthStoreBase with Store {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @observable
  String tempPhone = '';
  String verificationId = '';
  int resendToken = 0;
  Map currentUser = {};
  String uid = "";

  @action
  Future<Map> loginWithEmail(email, password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password
      );

      return {'uid': userCredential.user!.uid, 'error': false};
    } on FirebaseAuthException catch (e) {
      print('e.code ${e.code}');
      if (e.code == 'user-not-found') {
        return {'uid': null, 'error': true, 'message': 'User not found.'};
      } else if (e.code == 'wrong-password') {
        return {'uid': null, 'error': true, 'message': 'Wrong password provided for that user.'};
      }
      return {'error': true, 'message': 'Something went wrong.'};
    }
  }

  @action
  Future<Map> setupEmailAccount(email, password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password
      );
      return {'uid': userCredential.user!.uid, 'error': false};
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return {'uid': null, 'error': true, 'message': 'The password provided is too weak.'};
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        return {'uid': null, 'error': true, 'message': 'The account already exists for that email.'};
        print('The account already exists for that email.');
      }

      return {'error': true, 'message': 'Something went wrong.'};
    }
  }

  @action
  Future<void> sendOtp(phone, context, isLoginScreen) async {
    print(phone);
    try{
      await _auth.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (PhoneAuthCredential credential) {},
        // timeout: const Duration(seconds: 30),
        verificationFailed: ( e) {
          print('verification faild code ${e}');
          var message = "";
          if(e.code == "invalid-phone-number") {
            message = "Invalid phone number provided";
          }
          if(e.code == "too-many-requests") {
            message = "Too many requests";
          }
          else{
            message = "Something went Wrong.";
          }
          final snackBar = SnackBar(content: Text(message));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        codeSent: (String vId, int? token) {
          if(vId != "") {
            if(isLoginScreen == true) {
              AutoRouter.of(context).push(EnterOtpScreen(number: phone, vid: vId, resendToken: token.toString()));
            }
            else if(isLoginScreen == "otp"){
              final snackBar = SnackBar(content: Text("Otp has been sent."));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
            else{
              AutoRouter.of(context).push(SignUpOtpVerfication(number: phone, vid: vId, resendToken: token.toString()));
            }
          }
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    }
    catch(e) {
      print(e);
    }
  }

  @action
  Future<Map> verifyOtp(verificationId, otp, isLoginScreen) async {
    try{
      PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: otp);

      if(isLoginScreen == true) {
        final response = await _auth.signInWithCredential(phoneAuthCredential);
        print('response ${response.user!.uid}');
        return {'success': true, 'uid' : response.user!.uid};
      }
      else{
        final currentUser = _auth.currentUser;
       if(currentUser != null) {
         await _auth.currentUser!.linkWithCredential(phoneAuthCredential);
       }

      }

      return {'success': true};
    }
    on FirebaseAuthException catch (e)  {
      print(e.code );
      if (e.code == 'session-expired') {
        return {'error': true, 'message': 'Session expired please try again.'};
        print('The password provided is too weak.');
      } else if (e.code == 'invalid-verification-code') {
        return {'error': true, 'message': 'Invalid otp.'};
        print('The account already exists for that email.');
      }

      return {'error': true, 'message': 'Something went wrong.'};
    }
  }

  Future<void> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }
}