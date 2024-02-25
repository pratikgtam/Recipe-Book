import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_book/features/add/views/add_view.dart';
import 'package:recipe_book/features/profile/views/profile_view.dart';
import 'package:recipe_book/features/recipe/cubits/recipe_cubit.dart';
import 'package:recipe_book/features/recipe/models/recipe_model.dart';
import 'package:recipe_book/shared/app_constants.dart';
import 'package:recipe_book/shared/app_routes.dart';
import 'package:recipe_book/shared/image.dart';

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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
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
    final state = context.watch<RecipeCubit>().state.allRecipes;
    return Column(
      children: [
        const _BrandsList(),
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

class RecipeList extends StatelessWidget {
  const RecipeList({
    super.key,
    required this.recipes,
    this.gridView = true,
  });
  final List<RecipeModel> recipes;
  final bool gridView;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: recipes.isEmpty
          ? const Center(
              child: Text(
                'No products found',
              ),
            )
          : gridView
              ? GridView.builder(
                  itemCount: recipes.length,
                  padding: const EdgeInsets.only(
                    right: AppConstants.horizontalScreenPadding,
                    left: AppConstants.horizontalScreenPadding,
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 30,
                    mainAxisExtent: 203,
                  ),
                  itemBuilder: (context, index) {
                    RecipeModel recipe = recipes[index];

                    return _Recipe(recipe: recipe);
                  })
              : ListView.separated(
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 20),
                  itemCount: recipes.length,
                  padding: const EdgeInsets.only(
                    right: AppConstants.horizontalScreenPadding,
                    left: AppConstants.horizontalScreenPadding,
                  ),
                  itemBuilder: (context, index) {
                    RecipeModel recipe = recipes[index];

                    return _Recipe(recipe: recipe);
                  }),
    );
  }
}

class _Recipe extends StatelessWidget {
  const _Recipe({
    super.key,
    required this.recipe,
  });

  final RecipeModel recipe;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: SizedBox(
        height: 203,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  CustomNetworkImage(
                    width: double.infinity,
                    imageUrl: recipe.imageUrl,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                  )
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Text(
                  recipe.name ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.access_time,
                      size: 16,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      '${recipe.timeToPrepare ?? ''} mins',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Text(
                  recipe.description ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ],
        ),
      ),
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
              onTap: () {},
              name: item,
              selected: index == 0,
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
