import 'package:bobtail_cuisines/src/bobtail_custom_cubit/barrel.dart';
import 'package:bobtail_cuisines/src/screens/cuisines/cuisine_view.dart';
import 'package:bobtail_cuisines/src/screens/login/models/login_form_model.dart';
import 'package:bobtail_cuisines/src/services/login_service.dart';
import 'package:bobtail_cuisines/src/utils/bobtail_connection_status.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login_states.dart';

class LoginCubit extends BobtailBaseCubit<LoginStates> {
  LoginCubit() : super(LoginStates.initializing()) {
    emit(LoginStates.idle(state));
  }
  final LoginFormModel loginFormModel = LoginFormModel();
  LoginService loginService = LoginService(auth: FirebaseAuth.instance);

  firebaseSignInWithEmailAndPassword(BuildContext context, Map<String, dynamic> values) async {
    try {
      emit(LoginStates.busy(state));
      UserCredential user = await loginService.signInWithEmailAndPassword(values[LoginFormModel.userName], values[LoginFormModel.password]);
      if (user.user!.email != null) {
        emit(LoggedInState(login: true));
      } else {
        emit(LoginStates.idle(state));
      }
    } on Exception catch (error) {
      emit(LoginStates.error(state));
    } finally {
      // No need here as emit the possible states in try and on exception
    }
  }

  navigateToRemoveUntil(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, CuisineView.id, (route) => false);
  }

  refresh() async {
    if (await BobtailConnectionStatus.getInstance().isConnectedToInternet()) {
      emit(LoginStates.idle(state));
    } else {
      emit(LoginStates.error(state));
    }
  }

  validateFormAndRequestLogin(BuildContext context, var _formKey) async {
    if (await BobtailConnectionStatus.getInstance().isConnectedToInternet()) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        firebaseSignInWithEmailAndPassword(context, _formKey.currentState!.value);
      }
    } else {
      emit(LoginStates.error(state));
    }
  }
}
