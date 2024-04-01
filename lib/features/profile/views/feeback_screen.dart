import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:recipe_book/shared/app_button.dart';
import 'package:recipe_book/shared/custom_scaffold.dart';
import 'package:recipe_book/shared/text_input.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        title: 'Feedback',
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 16),
              TextInput(
                name: 'Title',
                hintText: 'Enter title',
                controller: _titleController,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter title';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextInput(
                controller: _descriptionController,
                name: 'Description',
                hintText: 'Enter description',
                maxLines: 5,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter description';
                  }
                  return null;
                },
              ),
              const Spacer(),
              AppButton(
                label: 'Submit',
                onPressed: () {
                  if (!_formKey.currentState!.validate()) {
                    return;
                  }
                  FirebaseFirestore.instance.collection('feedback').add({
                    'title': _titleController.text,
                    'description': _descriptionController.text,
                    'createdAt': DateTime.now(),
                  });
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 16),
            ],
          ),
        ));
  }
}
