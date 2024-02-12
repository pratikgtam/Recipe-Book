// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:recipe_book/features/auth/cubits/auth_cubit.dart';
import 'package:recipe_book/features/auth/cubits/auth_state.dart';
import 'package:recipe_book/features/auth/views/check_email_view.dart';
import 'package:recipe_book/shared/app_button.dart';
import 'package:recipe_book/shared/app_routes.dart';
import 'package:recipe_book/shared/app_utils.dart';
import 'package:recipe_book/shared/custom_scaffold.dart';
import 'package:recipe_book/shared/text_input.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: _listener,
      listenWhen: _listenWhen,
      child: CustomScaffold(
        title: 'Reset Password',
        body: FormBuilder(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Enter the email associated with your account and we’ll send an email with instructions to reset your password.',
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 24),
              TextInput(
                labelText: 'Email',
                hintText: 'Enter your email',
                name: 'email',
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.email(),
                ]),
              ),
              const SizedBox(height: 24),
              AppButton(
                label: 'Send',
                onPressed: context
                        .watch<AuthCubit>()
                        .state
                        .resetPasswordStatus
                        .isLoading
                    ? null
                    : _onSend,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onSend() {
    if (_formKey.currentState?.saveAndValidate() != true) {
      return;
    }
    final email = _formKey.currentState?.fields['email']?.value as String;
    context.read<AuthCubit>().resetPassword(email: email);
  }

  void _listener(BuildContext context, AuthState state) {
    if (state.resetPasswordStatus.succeeded) {
      AppRoutes(context).push(const CheckEmailView());
    }
    AppUtils.handleError(context, state.resetPasswordStatus);
  }

  bool _listenWhen(AuthState previous, AuthState current) {
    return previous.resetPasswordStatus != current.resetPasswordStatus;
  }
}
