import 'package:flutter/material.dart';

class Category {
  const Category({
    required this.id,
    required this.title,
    this.color = Colors.orange,
    this.imageUrl = '', // Provide a default value for imageUrl
  });

  final String id;
  final String title;
  final Color color;
  final String imageUrl; // imageUrl property

  // Add a named constructor to create a Category instance with only imageUrl
  Category.withImageUrl({
    required String imageUrl,
  })   : id = '',
        title = '',
        color = Colors.orange,
        imageUrl = imageUrl; // Assign the provided imageUrl
}
