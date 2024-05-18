// this will   show all the meals for selected category
// whenver we will tap on like different meals ice cream, roll ect
import 'package:flutter/material.dart';
import 'package:meal_2/models/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key,required this .title,
  required this.meals});
final String title;
final List<Meal>meals;

  @override
  Widget build(BuildContext context)  {
    Widget content=ListView.builder(itemBuilder:(ctx,index)=>Text(
      meals[index].title,
    ),
    );
    if(meals.isEmpty){
content=Center(
  child:Column(mainAxisSize:MainAxisSize.min,
  children:[const Text('Uh oh..nothing here'),
 const SizedBox(height:16),
    Text('Try selecting a different category!',
        style:Theme.of(context).textTheme).bodyLarge!.copyWith(
      color:Theme.of(context).colorSchema.onBackground,
    ),
    ],
   ),
);
    }
    return Scaffold(
      appBar:AppBar(
        title:Text(title),
      ),
      body
      ),
      )
    );
  }
}
