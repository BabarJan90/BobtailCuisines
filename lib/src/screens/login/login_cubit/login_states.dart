import 'package:bobtail_cuisines/src/bobtail_custom_cubit/barrel.dart';

class LoginStates extends BobtailBaseState {
  bool? loggedIn;

  LoginStates({
    bool? login,
  }) : loggedIn = login;
  LoginStates.initializing() : super.initializing();
  LoginStates.busy(LoginStates oldState)
      : loggedIn = oldState.loggedIn,
        super.busy();
  LoginStates.idle(LoginStates oldState)
      : loggedIn = oldState.loggedIn,
        super.idle();
  LoginStates.error(LoginStates oldState)
      : loggedIn = oldState.loggedIn,
        super.error();
}

class LoggedInState extends LoginStates {
  LoggedInState({
    required bool login,
  }) : super(
          login: login,
        );
}
