import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'model/recipe.dart';
import 'styles/styles.dart';

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
      body: ListView(
        children: [
          _buildPadding(Image.network(recipe.imageUrl)),
          _buildPadding(Text(recipe.description, style: Styles.textDefault)),
        ],
      )
    );
  }

  Widget _buildPadding(Widget content) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: content,
    );
  }
}