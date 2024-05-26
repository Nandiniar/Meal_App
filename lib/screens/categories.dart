import 'package:flutter/material.dart';
import 'package:meal_2/data/dummy_dart.dart';
import 'package:meal_2/screens/meals.dart';
import 'package:meal_2/widgets/category_grid_item.dart';
import 'package:meal_2/models/category.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectCategory(BuildContext context,Category category) {
    // Buildcontext represent the location of widget in
    // the widget tree
    final filteredMeals=dummyMeals.where((meal) => meal.categories.contains(category.id)).toList();
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) =>
        MealsScreen(title: category.title,
            meals: filteredMeals))); // Navigator.push(context,route);(meaning of both are same)
    // MaterialPageRoute is a special type of page(with animations and style) or screen in a Flutter
    // MaterialPageRoute is used when we move from one page to another in Flutter , we see a
    // transition and these tranisition is handles with the help of MaterialPageRoute
    // The builder function is just a way to tell Flutter how to create the new page's content.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick your category'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20
        ),
          children: [
            // here in case of  for loop , we can use map
            //availableCategories.map((category)=> category:category ) ).toList()
            for(final category in availableCategories)// availableCategories Model wale file se aayega
              CategoryGridItem(category:category,onSelectCategory:(){
                _selectCategory(context, category);
              })

        ],
      ),
    );
  }
}
