import 'package:flutter/material.dart';

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
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.1),
              border: Border.all(
                color: Theme.of(context).primaryColor,
              ),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.person_outline,
              size: 80,
            ),
          ),
          const SizedBox(height: 32),
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
          const SizedBox(height: 16),
        ],
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
