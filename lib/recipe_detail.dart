import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class RecipeDetail extends StatefulWidget {
  final DocumentSnapshot recipe;

  RecipeDetail({this.recipe});

  RecipeDetailState createState() => RecipeDetailState();
}

class RecipeDetailState extends State<RecipeDetail> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.data["title"]),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(bottom: 15, left: 8),
          child: Column(
            children: [  
              Image.network(widget.recipe.data["image"]),
              Text("Ingredients", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              Text(widget.recipe.data["ingredientLines"][0]),
              Text(widget.recipe.data["ingredientLines"][1]),
              Text(widget.recipe.data["ingredientLines"][2]),
            ],
          )
        ),
      )
    );
  }
}