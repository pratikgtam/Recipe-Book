import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:recipe_book/features/auth/cubits/auth_cubit.dart';
import 'package:recipe_book/features/auth/cubits/auth_state.dart';
import 'package:recipe_book/features/recipe/ui/welcome.dart';
import 'package:recipe_book/shared/app_button.dart';
import 'package:recipe_book/shared/app_routes.dart';
import 'package:recipe_book/shared/app_utils.dart';
import 'package:recipe_book/shared/custom_scaffold.dart';
import 'package:recipe_book/shared/text_input.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  String password = '';
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AuthCubit>().state;
    return CustomScaffold(
      title: 'Sign Up',
      body: BlocListener<AuthCubit, AuthState>(
        listener: _listener,
        listenWhen: _listenWhen,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: FormBuilder(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  TextInput(
                    name: 'email',
                    labelText: 'Email',
                    hintText: 'Email',
                    textInputType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.email(),
                    ]),
                  ),
                  const SizedBox(height: 16),
                  TextInput(
                    name: 'password',
                    labelText: 'Password',
                    hintText: 'Password',
                    obscureText: true,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.visiblePassword,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.minLength(8),
                    ]),
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: Text(
                      state.signupStatus.error?.toString() ?? '',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  AppButton(
                    label: 'Register',
                    onPressed:
                        state.signupStatus.isLoading ? null : _onRegister,
                  ),
                  const SizedBox(height: 22),
                  const _HaveAnAccount(),
                  const SizedBox(height: 22),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onRegister() {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      final formValue = _formKey.currentState?.value;

      context.read<AuthCubit>().register(formValue);
    }
  }

  void _listener(BuildContext context, AuthState state) {
    if (state.signupStatus.succeeded) {
      AppRoutes(context).pushAndRemoveUntil(const Welcome());
    }
    AppUtils.handleError(context, state.signupStatus);
  }

  bool _listenWhen(AuthState previous, AuthState current) {
    return previous.signupStatus != current.signupStatus;
  }
}

class _HaveAnAccount extends StatelessWidget {
  const _HaveAnAccount();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: 'Have an account? ',
              style: TextStyle(
                // color: AppColors.neutral400,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            TextSpan(
              text: 'Login',
              style: TextStyle(
                // color: AppColors.secondary,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
