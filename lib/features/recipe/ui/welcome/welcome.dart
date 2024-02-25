import 'package:flutter/material.dart';
import 'package:recipe_book/features/add/views/add_view.dart';
import 'package:recipe_book/features/profile/views/profile_view.dart';
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
    return Column(
      children: [
        const _BrandsList(),
        _RecipeList(recipes: [
          RecipeModel(),
          RecipeModel(),
          RecipeModel(),
          RecipeModel(),
          RecipeModel(),
          RecipeModel(),
          RecipeModel(),
          RecipeModel(),
        ]),
      ],
    );
  }
}

class _RecipeList extends StatelessWidget {
  const _RecipeList({
    required this.recipes,
  });
  final List<RecipeModel> recipes;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: recipes.isEmpty
          ? const Center(
              child: Text(
                'No products found',
              ),
            )
          : GridView.builder(
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

                return GestureDetector(
                  onTap: () {},
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Stack(
                          children: [
                            CustomNetworkImage(
                              imageUrl: recipe.image,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        recipe.name ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 5),
                    ],
                  ),
                );
              }),
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
            final item = AppConstants.categories[index];
            return _HorizontalFilterItem(
              onTap: () {},
              name: item,
              selected: index == 0,
            );
          },
          scrollDirection: Axis.horizontal,
          itemCount: AppConstants.categories.length,
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
