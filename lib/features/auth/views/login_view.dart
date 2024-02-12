import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:recipe_book/features/auth/cubits/auth_cubit.dart';
import 'package:recipe_book/features/auth/cubits/auth_state.dart';
import 'package:recipe_book/features/auth/views/reset_password_view.dart';
import 'package:recipe_book/features/auth/views/sign_up_view.dart';
import 'package:recipe_book/features/home/home_view.dart';
import 'package:recipe_book/shared/app_button.dart';
import 'package:recipe_book/shared/app_routes.dart';
import 'package:recipe_book/shared/app_utils.dart';
import 'package:recipe_book/shared/custom_scaffold.dart';
import 'package:recipe_book/shared/text_input.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Login',
      showAppBar: false,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: InkWell(
          onTap: () {
            AppRoutes(context).push(const SignUpView());
          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 18,
            ),
            child: const Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Don’t have an account?',
                    style: TextStyle(
                      color: Color(0xFFABC2CB),
                      fontSize: 15,
                    ),
                  ),
                  TextSpan(
                    text: ' ',
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                  TextSpan(
                    text: 'Sign Up ',
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<AuthCubit, AuthState>(
            listener: _listenerLogin,
            listenWhen: _listenWhen,
          ),
          // BlocListener<AuthCubit, AuthState>(
          //   listener: _listenerSso,
          //   listenWhen: _listenWhenSso,
          // ),
        ],
        child: FormBuilder(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 8),
                TextInput(
                  name: 'email',
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.email(),
                  ]),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextInput(
                  name: 'password',
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  obscureText: true,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                  ]),
                ),
                InkWell(
                  onTap: () =>
                      AppRoutes(context).push(const ResetPasswordView()),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Forgot Password?',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                AppButton(
                  label: 'Login',
                  onPressed:
                      context.watch<AuthCubit>().state.loginStatus.isLoading
                          ? null
                          : _onLogin,
                ),
                const SizedBox(
                  height: 22,
                ),
                // const Text(
                //   'or Login with',
                //   textAlign: TextAlign.center,
                //   style: TextStyle(
                //     fontSize: 13,
                //   ),
                // ),
                // const SizedBox(
                //   height: 24,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onLogin() {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      context.read<AuthCubit>().login(_formKey.currentState?.value);
    }
  }

  void _listenerLogin(BuildContext context, AuthState state) {
    if (state.loginStatus.succeeded) {
      _navigateSuccess();
    } else if (state.loginStatus.failed) {
      AppUtils.handleError(context, state.loginStatus);
    }
  }

  void _navigateSuccess() {
    AppRoutes(context).pushAndRemoveUntil(const HomeView());
  }

  bool _listenWhen(AuthState previous, AuthState current) {
    return previous.loginStatus != current.loginStatus;
  }
}
