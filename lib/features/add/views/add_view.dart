import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:recipe_book/features/add/cubits/add_cubit.dart';
import 'package:recipe_book/shared/custom_scaffold.dart';
import 'package:recipe_book/shared/text_input.dart';

class AddView extends StatefulWidget {
  const AddView({super.key});

  @override
  State<AddView> createState() => _AddViewState();
}

class _AddViewState extends State<AddView> {
  @override
  void initState() {
    super.initState();
  }

  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Add Recipe',
      body: SingleChildScrollView(
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  context.read<AddCubit>().pickImage();
                },
                child: Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.25),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.camera_alt,
                        size: 50,
                      ),
                      Text('Add photo'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextInput(
                name: 'name',
                labelText: 'Recipe name',
                hintText: 'Momo',
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 16),
              const TextInput(
                name: 'description',
                labelText: 'Description',
                maxLines: 3,
                hintText:
                    'Momo is a famous dish in Nepal. It is a type of dumpling filled with meat and vegetables. It is served with achar.',
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 16),
              const TextInput(
                name: 'ingredients',
                labelText: 'Ingredients',
                maxLines: 3,
                hintText: 'Flour, meat, vegetables, salt, oil, spices',
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 16),
              const TextInput(
                name: 'steps',
                labelText: 'Steps',
                maxLines: 3,
                hintText:
                    '1. Mix flour and water. 2. Prepare filling. 3. Make momo. 4. Steam momo.',
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
