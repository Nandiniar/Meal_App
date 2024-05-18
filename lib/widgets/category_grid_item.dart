import 'package:flutter/material.dart';
import 'package:meal_2/models/category.dart';

class CategoryGridItem extends StatelessWidget {
  final Category category;

  const CategoryGridItem({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap:() {},
      splashColor:Theme.of(context).primaryColor,
      borderRadius:BorderRadius.circular(16),

    child:Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            category.color.withOpacity(0.55),
            category.color.withOpacity(0.9),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        image: DecorationImage(
          image: AssetImage('FAssets/${category.imageUrl}'), // Corrected image path
          fit: BoxFit.cover,
        ),
      ),
      child: Text(
        category.title,
        style: Theme.of(context).textTheme.headline6!.copyWith(
          color: Theme.of(context).colorScheme.onBackground,
        ),
      ),
    ),
    );
  }
}
