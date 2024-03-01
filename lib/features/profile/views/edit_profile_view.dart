import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:recipe_book/features/profile/cubits/profile_cubit.dart';
import 'package:recipe_book/features/profile/cubits/profile_state.dart';
import 'package:recipe_book/shared/app_button.dart';
import 'package:recipe_book/shared/custom_scaffold.dart';
import 'package:recipe_book/shared/text_input.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    context.read<ProfileCubit>().getProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final updateState = context.watch<ProfileCubit>().state.update;
    return CustomScaffold(
      title: 'Edit Profile',
      body: BlocListener<ProfileCubit, ProfileState>(
        listener: _listener,
        listenWhen: (previous, current) => previous.profile != current.profile,
        child: FormBuilder(
          key: _formKey,
          child: Column(children: [
            TextInput(
              name: 'fullName',
              labelText: 'Full name',
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
              ]),
            ),
            const SizedBox(height: 12),
            const TextInput(
              name: 'email',
              labelText: 'Email',
              readOnly: true,
            ),
            const Spacer(),
            AppButton(
                label: 'Save',
                onPressed: updateState.isLoading
                    ? null
                    : () {
                        if (_formKey.currentState?.saveAndValidate() ?? false) {
                          context
                              .read<ProfileCubit>()
                              .updateProfile(_formKey.currentState?.value);
                        }
                      }),
          ]),
        ),
      ),
    );
  }

  void _listener(BuildContext context, ProfileState state) {
    if (state.profile.succeeded) {
      _formKey.currentState?.patchValue(state.profile.result?.toJson() ?? {});
    }
  }
}
