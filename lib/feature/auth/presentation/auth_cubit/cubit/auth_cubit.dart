import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalel/feature/auth/presentation/auth_cubit/cubit/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  String? fristName;
  String? lastName;
  String? emailAddress;
  String? password;
  bool? updateTermesAndConditionCheckBoxValue = false;
  GlobalKey<FormState> signupFormkey = GlobalKey();
  GlobalKey<FormState> signInFormkey = GlobalKey();
  GlobalKey<FormState> forgotpasswordFormkey = GlobalKey();

  Future<void> signUpWithEmailAndPassWord() async {
    try {
      emit(SignUplodingStete());

      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress!,
        password: password!,
      );
      //await addUseProfile();
      await verifyEmail();
      emit(SignUpSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(SignUpFailureState(
            errMessage: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(SignUpFailureState(
            errMessage: 'The account already exists for that email.'));
      } else if (e.code == 'invalid-email') {
        emit(SignUpFailureState(errMessage: 'The Email Is Invalid'));
      }
    } catch (e) {
      emit(SignUpFailureState(errMessage: e.toString()));
    }
  }

  void updateTermesAndConditionCheckBox({required newValue}) {
    updateTermesAndConditionCheckBoxValue = newValue;
    emit(TermesAndconditionsUpdateState());
  }

  Future<void> signInWithEmailAndPassword() async {
    try {
      emit(SignInlodingStete());
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailAddress!, password: password!);
      emit(SignInSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        emit(SignUpFailureState(
            errMessage: 'The account already exists for that email.'));
      } else if (e.code == 'weak-password') {
        emit(SignUpFailureState(
            errMessage: 'The password provided is too weak.'));
      } else {
        emit(SignInFailureState(errMessage: 'Chech Your Email Or passWord'));
      }
    } catch (e) {
      emit(SignInFailureState(errMessage: e.toString()));
    }
  }

  Future<void> verifyEmail() async {
    await FirebaseAuth.instance.currentUser!.sendEmailVerification();
  }

  Future<void> resetPasswordWithLink() async {
    try {
      emit(ResetPasswordlodingStete());
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailAddress!);
      emit(ResetPasswordSuccessState());
    } catch (e) {
      emit(ResetPasswordFailureState(errMessage: e.toString()));
    }
  }

  Future<void> addUseProfile() async {
    CollectionReference users = FirebaseFirestore.instance.collection("users");
    await users.add({
      "first_name": fristName,
      "last_name": lastName,
      "email": emailAddress,
    });
  }
}
