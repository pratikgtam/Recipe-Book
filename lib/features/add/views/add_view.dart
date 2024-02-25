import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:recipe_book/features/add/cubits/add_cubit.dart';
import 'package:recipe_book/features/add/cubits/add_state.dart';
import 'package:recipe_book/features/recipe/cubits/recipe_cubit.dart';
import 'package:recipe_book/shared/app_button.dart';
import 'package:recipe_book/shared/app_constants.dart';
import 'package:recipe_book/shared/app_utils.dart';
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
    context.read<AddCubit>().clear();
    super.initState();
  }

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final imageUrl = context.select((AddCubit cubit) => cubit.state.imageUrl);
    final state = context.watch<AddCubit>().state.addState;
    return CustomScaffold(
      bottomNavigationBar: AppButton(
        onPressed: state.isLoading
            ? null
            : () {
                if (_formKey.currentState!.saveAndValidate()) {
                  context.read<AddCubit>().addRecipe(
                        _formKey.currentState!.value,
                      );
                }
              },
        label: 'Add Recipe',
      ),
      title: 'Add Recipe',
      body: BlocListener<AddCubit, AddState>(
        listener: _listener,
        child: SingleChildScrollView(
          child: FormBuilder(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () => context.read<AddCubit>().pickImage(),
                  child: Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.25),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: imageUrl != null
                        ? Image.network(
                            imageUrl,
                            fit: BoxFit.cover,
                          )
                        : const Column(
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
                TextInput(
                  name: 'description',
                  labelText: 'Description',
                  maxLines: 3,
                  hintText:
                      'Momo is a famous dish in Nepal. It is a type of dumpling filled with meat and vegetables. It is served with achar.',
                  textInputAction: TextInputAction.next,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                  ]),
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
                TextInput(
                  name: 'timeToPrepare',
                  labelText: 'Time to prepare',
                  hintText: '30',
                  suffixText: 'minutes',
                  textInputAction: TextInputAction.next,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.numeric(),
                  ]),
                ),
                const SizedBox(height: 16),
                const Text('Categories',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    )),
                const SizedBox(height: 4),
                Wrap(
                  spacing: 8,
                  children: AppConstants.categories.map((category) {
                    return FilterChip(
                      label: Text(category),
                      selected: context
                          .watch<AddCubit>()
                          .state
                          .categories
                          .contains(category),
                      onSelected: (bool selected) {
                        if (selected) {
                          context.read<AddCubit>().addCategory(category);
                        } else {
                          context.read<AddCubit>().removeCategory(category);
                        }
                      },
                    );
                  }).toList(),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _listener(BuildContext context, AddState state) {
    if (state.addState.succeeded) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Recipe added successfully'),
        ),
      );
      context.read<RecipeCubit>().getAllRecipes();

      Navigator.pop(context);
    }
    AppUtils.handleError(context, state.addState);
  }
}
