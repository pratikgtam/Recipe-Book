import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_book/features/add/views/add_view.dart';
import 'package:recipe_book/features/profile/cubits/profile_cubit.dart';
import 'package:recipe_book/features/profile/views/profile_view.dart';
import 'package:recipe_book/features/recipe/cubits/recipe_cubit.dart';
import 'package:recipe_book/features/recipe/ui/recipe_list.dart';
import 'package:recipe_book/shared/app_constants.dart';
import 'package:recipe_book/shared/app_routes.dart';
import 'package:recipe_book/shared/text_input.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  Widget body = const Home();
  @override
  void initState() {
    context.read<RecipeCubit>().getAllRecipes();
    context.read<ProfileCubit>().getProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final name =
        context.watch<ProfileCubit>().state.profile.result?.fullName ?? '';
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome $name'),
        centerTitle: false,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AppRoutes(context).push(const AddView());
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          if (index == 1) {
            setState(() {
              body = const ProfileView();
            });
          } else if (index == 0) {
            setState(() {
              body = const Home();
            });
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      body: body,
    );
  }
}

class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final state = context.watch<RecipeCubit>().state.recipes;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.horizontalScreenPadding),
          child: TextInput(
              name: 'Search',
              hintText: 'Search for recipes',
              autofocus: false,
              onChanged: (value) {
                context.read<RecipeCubit>().search(value);
              }),
        ),
        const SizedBox(height: 12),
        const Padding(
          padding: EdgeInsets.only(left: 12.0),
          child: _BrandsList(),
        ),
        if (state.isLoading)
          const Center(
            child: CircularProgressIndicator(),
          )
        else
          RecipeList(recipes: state.result ?? []),
      ],
    );
  }
}

class _BrandsList extends StatelessWidget {
  const _BrandsList();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: SizedBox(
        height: 30,
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.horizontalScreenPadding - 10),
          itemBuilder: (context, index) {
            final item =
                index == 0 ? 'All' : AppConstants.categories[index - 1];
            return _HorizontalFilterItem(
              onTap: () {
                context.read<RecipeCubit>().selectCategory(item);
              },
              name: item,
              selected:
                  context.watch<RecipeCubit>().state.selectedCategory == item,
            );
          },
          scrollDirection: Axis.horizontal,
          itemCount: AppConstants.categories.length + 1,
        ),
      ),
    );
  }
}

class _HorizontalFilterItem extends StatelessWidget {
  const _HorizontalFilterItem({
    required this.name,
    required this.selected,
    this.onTap,
  });
  final String name;
  final bool selected;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        decoration: BoxDecoration(
          color: selected ? Theme.of(context).primaryColor : null,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          name,
          style: TextStyle(
            color: selected ? Colors.white : Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
