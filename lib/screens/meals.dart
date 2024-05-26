// this will   show all the meals for selected category
// whenver we will tap on like different meals ice cream, roll ect
import 'package:flutter/material.dart';
import 'package:meal_2/models/meal.dart';
import 'package:meal_2/widgets/meal_item.dart';
import 'package:meal_2/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key,required this .title,
  required this.meals});
final String title;
final List<Meal>meals;

  @override
  Widget build(BuildContext context)  {
    Widget content=ListView.builder(itemBuilder:(ctx,index)=>Text(// here itembuilder is
      // a function which is used to create the list,it takes two parameter ctx and
      // index, ctx tells the location of the widget is being built
      // index tell the index of the item being created
      meals[index].title,
    ),
    );
    if(meals.isEmpty){
content=Center(
  child:Column(mainAxisSize:MainAxisSize.min,
  children:[ Text('Uh oh..nothing here !',style:Theme.of(context).textTheme.headlineLarge!.copyWith(
      color:Theme.of(context).colorScheme.onBackground,),),
 const SizedBox(height:16),
    Text('Try selecting a different category!',
        style:Theme.of(context).textTheme.bodyLarge!.copyWith(
      color:Theme.of(context).colorScheme.onBackground,
        ),
    ),
    ],
   ),
);

    }
    if(meals.isNotEmpty){
      content=ListView.builder(//listview is a scrollable list
        itemCount :meals.length,
        itemBuilder:(ctx,index)=>MealItem(meal: meals[index]),

      );
    }
    return Scaffold(
      appBar:AppBar(
        title:Text(title),
      ),
      body:content,


    );
  }
}
