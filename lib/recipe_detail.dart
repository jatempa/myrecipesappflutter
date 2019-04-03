import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'recipe.dart';

class RecipeDetail extends StatefulWidget {
  final DocumentSnapshot snapshot;

  RecipeDetail(this.snapshot);

  RecipeDetailState createState() => RecipeDetailState();
}

class RecipeDetailState extends State<RecipeDetail> {
  
  @override
  Widget build(BuildContext context) {
    final recipe = Recipe.fromSnapshot(widget.snapshot);

    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.name),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(bottom: 15, left: 8),
          child: Column(
            children: [  
              Image.network(recipe.imageUrl),
              Text("Ingredients", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            ],
          )
        ),
      )
    );
  }
}