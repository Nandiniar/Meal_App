 import 'package:flutter/material.dart';
import 'package:meal_2/models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
   const MealDetailsScreen({super.key,required this.meal});

   final  Meal meal;
 
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar:AppBar(
         title: Text(meal.title),
       ),
       body:Image.network(
       meal.imageUrl,// in this image will be loaded from internet
       height:300,
        width:double.infinity,
         fit:BoxFit.cover,
       ),// this ensure that whole available space should be filled
     );
   }
 }
 