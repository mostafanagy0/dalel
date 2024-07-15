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

  signUpWithEmailAndPassWord() async {
    try {
      emit(SignUplodingStete());

      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress!,
        password: password!,
      );
      emit(SignUpSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(SignUpFailureState(
            errMessage: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(SignUpFailureState(
            errMessage: 'The account already exists for that email.'));
      }
    } catch (e) {
      emit(SignUpFailureState(errMessage: e.toString()));
    }
  }

  updateTermesAndConditionCheckBox({required newValue}) {
    updateTermesAndConditionCheckBoxValue = newValue;
    emit(SignUpTermesAndconditionsUpdateState());
  }

  signInWithEmailAndPassword() async {
    try {
      emit(SignInlodingStete());
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailAddress!, password: password!);
      emit(SignInSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(SignUpFailureState(errMessage: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(SignUpFailureState(
            errMessage: 'Wrong password provided for that user.'));
      }
    } catch (e) {
      emit(SignInFailureState(errMessage: e.toString()));
    }
  }
}
