import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'model/recipe.dart';
import 'recipe_detail.dart';
import 'styles/styles.dart';

class RecipeList extends StatefulWidget {
  RecipeListState createState() => RecipeListState();
}

class RecipeListState extends State<RecipeList> {
  final db = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
       stream: db.collection('recipes').snapshots(),
       builder: (context, snapshot) {
         if (!snapshot.hasData) {
           return Center(child: CircularProgressIndicator());
         } 
    
         return _buildList(context, snapshot.data.documents);
       },
     );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot snapshot) {
    final recipe = Recipe.fromSnapshot(snapshot);

    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      leading: Image.network(recipe.imageUrl, height: 70, width: 70),
      title: RichText(
        maxLines: 2,
        text: TextSpan(
          text: recipe.name,
          style: Styles.headerLarge
        )
      ),
      subtitle: RichText(
        maxLines: 3,
        text: TextSpan(
          text: recipe.description,
          style: Styles.textDefault,
        ),
      ),
      trailing: Text(recipe.dietLabel, style: Styles.textDietLabel(recipe.dietLabel)),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecipeDetail(snapshot)
          ),
        );
      },
    );
  }
}