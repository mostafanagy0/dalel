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
  bool? updateTermesAndConditionCheckBoxValue;
  GlobalKey<FormState> signupFormkey = GlobalKey();

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
}
