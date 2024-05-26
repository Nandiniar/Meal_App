// this is useeful jo hum meal items se data aarha hoga usme icon and uske corresponding text ke liye ha

import 'package:flutter/material.dart'; // this imports material design from flutter which includes many useful widgets
// and tools for building user interfaces


class MealItemtrait extends StatelessWidget {
  const MealItemtrait({super.key,required this.icon,required this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children:[
        Icon(icon,size: 17, color:Colors.white),
       const SizedBox(width:6),
        Text(
          label,
          style:const TextStyle(
            color:Colors.white,
          )
        ),
      ]
    );
  }
}
