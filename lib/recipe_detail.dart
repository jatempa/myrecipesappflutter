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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Image.network(recipe.imageUrl),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(recipe.description, style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        )
      )
    );
  }
}