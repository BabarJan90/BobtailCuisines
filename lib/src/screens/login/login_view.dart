import 'package:bobtail_cuisines/src/bobtail_custom_cubit/barrel.dart';
import 'package:bobtail_cuisines/src/custom_widgets/bobtail_text_widgets/barrel.dart';
import 'package:bobtail_cuisines/src/custom_widgets/error_view.dart';
import 'package:bobtail_cuisines/src/custom_widgets/forms/bobtail_form_buidler.dart';
import 'package:bobtail_cuisines/src/custom_widgets/forms/bobtail_text_field.dart';
import 'package:bobtail_cuisines/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:bobtail_cuisines/src/custom_widgets/buttons/bobtail_outlined_button.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'login_cubit/login_cubit.dart';
import 'login_cubit/login_states.dart';
import 'models/login_form_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormBuilderState>(debugLabel: 'log-in-form');

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CubitProvider<LoginStates, LoginCubit>(
        create: (context) => LoginCubit(),
        listener: (context, state, bloc) {
          if (state is LoggedInState) {
            bloc.navigateToRemoveUntil(context);
          }
        },
        builder: (context, state, bloc) {
          return state.initializing || state.busy || state is LoggedInState
              ? const Center(
                  child: CircularProgressIndicator(color: BobtailCustomColors.darkYellow))
              : state.error
                  ? Center(
                      child: ErrorView(
                          key: UniqueKey(),
                          onTap: () {
                            bloc.refresh();
                          }))
                  : Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: LayoutBuilder(
                        builder: (BuildContext context, BoxConstraints viewportConstraints) {
                          return SingleChildScrollView(
                            child: SizedBox(
                              height: viewportConstraints.maxHeight,
                              child: Column(
                                children: <Widget>[
                                  Expanded(
                                    flex: 2,
                                    child: Center(
                                        child: BobtailBlackHeadLineText(
                                      'Bobtail',
                                      style: Theme.of(context).textTheme.headline3,
                                    )),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: BobtailFormBuidler(
                                      key: _formKey,
                                      autovalidateMode: AutovalidateMode.disabled,
                                      initialValue: bloc.loginFormModel.initialValue,
                                      child: Column(
                                        children: [
                                          BobtailTextField(
                                            name: LoginFormModel.userName,
                                            labelText: '',
                                            hintText: 'email/user name',
                                            keyboardType: TextInputType.text,
                                            validator: FormBuilderValidators.compose([
                                              FormBuilderValidators.required(context),
                                              FormBuilderValidators.email(context),
                                            ]),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          BobtailTextField(
                                            name: LoginFormModel.password,
                                            labelText: '',
                                            hintText: 'password',
                                            keyboardType: TextInputType.text,
                                            obscureText: true,
                                            validator: FormBuilderValidators.minLength(
                                              context,
                                              6,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 40,
                                          ),
                                          BobtailOutlinedButton(
                                            title: 'LOG IN',
                                            onPressed: () async {
                                              bloc.validateFormAndRequestLogin(context, _formKey);
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
        },
      ),
    );
  }
}
