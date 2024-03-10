import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_book/features/auth/cubits/auth_cubit.dart';
import 'package:recipe_book/features/auth/views/login_view.dart';
import 'package:recipe_book/features/profile/cubits/profile_cubit.dart';
import 'package:recipe_book/features/profile/views/edit_profile_view.dart';
import 'package:recipe_book/features/profile/views/profile_detail_view.dart';
import 'package:recipe_book/features/recipe/ui/my_recipe.dart';
import 'package:recipe_book/shared/app_routes.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final profile = context.watch<ProfileCubit>().state.profile.result;
    final imageUrl = profile?.profilePic ?? '';
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () {
              context.read<ProfileCubit>().updateProfilePic();
            },
            child: ProfilePic(imageUrl: imageUrl),
          ),
          const SizedBox(height: 32),
          _ListTile(
            title: 'My Profile',
            onTap: () {
              AppRoutes(context).push(ProfileDetailView(profile: profile));
            },
            icon: Icons.person_outline,
          ),
          _ListTile(
            title: 'Edit Profile',
            onTap: () {
              AppRoutes(context).push(const EditProfileView());
            },
            icon: Icons.edit,
          ),
          _ListTile(
            title: 'My Recipes',
            onTap: () {
              AppRoutes(context).push(const MyRecipe());
            },
            icon: Icons.food_bank,
          ),
          _ListTile(
            title: 'Notifications',
            onTap: () {},
            icon: Icons.notifications_none,
          ),
          _ListTile(
            title: 'Help',
            onTap: () {},
            icon: Icons.help_outline,
          ),
          _ListTile(
            title: 'About',
            onTap: () {},
            icon: Icons.info_outline,
          ),
          _ListTile(
            title: 'Logout',
            onTap: () {
              context.read<AuthCubit>().logout();
              AppRoutes(context).pushAndRemoveUntil(const LoginView());
            },
            icon: Icons.logout,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.1),
        border: Border.all(
          color: Theme.of(context).primaryColor,
        ),
        shape: BoxShape.circle,
      ),
      child: imageUrl.isNotEmpty
          ? ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network(
                imageUrl,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            )
          : const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.person_outline,
                size: 80,
              ),
            ),
    );
  }
}

class _ListTile extends StatelessWidget {
  const _ListTile({
    required this.title,
    required this.onTap,
    required this.icon,
  });
  final String title;
  final Null Function() onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      title: Text(title),
      leading: Icon(icon),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
