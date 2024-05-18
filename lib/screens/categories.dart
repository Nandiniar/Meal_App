import 'package:flutter/material.dart';
import 'package:meal_2/data/dummy_dart.dart';
import 'package:meal_2/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
title:const Text('Pick your category'),
      ),
      body: GridView(
        padding: const  EdgeInsets.all(24),
        gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:2,
            childAspectRatio:3/2,
        crossAxisSpacing:20,
        mainAxisSpacing:20
        ),
          children: [
            // here in case of  for loop , we can use map
            //availableCategories.map((category)=> category:category ) ).toList()
            for(final category in availableCategories)// availableCategories Model wale file se aayega
              CategoryGridItem(category:category)

          ],
      ),
    );
  }
}
