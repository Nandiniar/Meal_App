// this will   show all the meals for selected category
// whenver we will tap on like different meals ice cream, roll ect
import 'package:flutter/material.dart';
import 'package:meal_2/models/meal.dart';
import 'package:meal_2/screens/meal_details.dart';
import 'package:meal_2/widgets/meal_item.dart';
import 'package:meal_2/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key,required this .title,
  required this.meals});
final String title;
final List<Meal>meals;
// this selectMeal is used because  This function navigates from the current screen to a new screen that shows the details of a meal.

void selectMeal(BuildContext context,Meal meal){ //BuildContext context   is a special object that gives access to the location
  // in the widget tree where the function is called
  Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>MealDetailsScreen(meal: meal),),);
  // A navigator manages a stack of pages (or routes) in your app, allowing you to move between different screens.
  // push : This method adds a new route to the navigator's stack, meaning it navigates to a new screen.,
  // MaterialPageRoute: This is a widget that creates a new route (or page) that will be animated into view. It provides the transition animation for the new screen.
  // builder: (ctx) => MealDetailsScreen(meal: meal): This is a function that builds the new screen.
  // (ctx): This is the context for the new route.
 //  MealDetailsScreen(meal: meal): This means that the new screen will be an instance of MealDetailsScreen, and it will be passed the meal object as an argument.
}

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
        itemBuilder:(ctx,index)=>MealItem(meal: meals[index],
          onSelectMeal:(context,meal){
selectMeal(context, meal);
        },
        ),

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
