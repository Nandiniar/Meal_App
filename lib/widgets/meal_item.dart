
// yeh wala page tab ke liye ha , jab hum jo first page ha pick your category wala  usme se koi category like pizza, burger chose karenge toh uske andar ka
// jo content dekhega uske liye


import 'package:flutter/material.dart';
import 'package:meal_2/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:meal_2/widgets/meal_item_trait.dart';


class MealItem extends StatelessWidget { // this means that MealItem is a subclass of Stateless Widget , here stateless widget
  // is a super class and MealItem is a subclass
  const MealItem({super.key, required this.meal,required this.onSelectMeal});// this line is a consturctor for MealItem widget , here super refers to the parent class
  // key is a parameter in the parent class constructor, This key identify and manage the widget in the widget tree

  final Meal meal;// here Meal is a custom data type which is defined in models/meal.dart. It blueprint for creating meal objects
  // here meal is the name of variable ,it is the instance of Meal data type.
   final void Function(BuildContext context,Meal meal) onSelectMeal;

  String get complexityText {// this is a getter function in dart
    return meal.complexity.name[0].toUpperCase() +  // here it will return the name of complexity of meal object (here if
        meal.complexity.name.substring(1);  //name of the complexity is easy , then it will return Easy
  }

  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override // here override tells that it is replacing a method that exists in a parent class with a new version in a subclass
  // override helps in making our code clearner and prevents mistake.
  Widget build(BuildContext context) { // every stateless widget has build which provides that how our state should like
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip.hardEdge,
      elevation: 2,// elevation means it add shadow below the card for the raised effect.
      child: InkWell(
        onTap: (){
          onSelectMeal(context,meal);
        },
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),// it shows the temporary image while the image is loading
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,// it ensure that the image cover the entire area of the widget
              height: 200,
              width: double.infinity,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 12), // it places some space between the text and row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MealItemtrait(
                          icon: Icons.schedule,
                          label: '${meal.duration} min',
                        ),
                        MealItemtrait(
                          icon: Icons.work,
                          label: complexityText,
                        ),
                        MealItemtrait(
                          icon: Icons.attach_money,
                          label: affordabilityText,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
