import 'package:flutter/material.dart';
import 'package:recipe_book/features/profile/models/profile_model.dart';
import 'package:recipe_book/features/profile/views/profile_view.dart';
import 'package:recipe_book/shared/custom_scaffold.dart';

class ProfileDetailView extends StatelessWidget {
  const ProfileDetailView({super.key, required this.profile});
  final ProfileModel? profile;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Profile',
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 20),
            ProfilePic(imageUrl: profile?.profilePic ?? ''),
            const SizedBox(height: 20),
            Text(
              profile?.fullName ?? '',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              profile?.email ?? '',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
