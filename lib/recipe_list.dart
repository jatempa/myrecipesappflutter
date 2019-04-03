import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'recipe.dart';
import 'recipe_detail.dart';
import 'styles.dart';

class RecipeList extends StatefulWidget {
  RecipeListState createState() => RecipeListState();
}

class RecipeListState extends State<RecipeList> {

  Future getRecipes() async {
    var firestore = Firestore.instance;

    QuerySnapshot qn = await firestore.collection('recipes').getDocuments();

    return qn.documents;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getRecipes(),
      builder: (_, snapshot) {
        if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
        return _buildList(context, snapshot.data);
      }
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot snapshot) {
    final recipe = Recipe.fromSnapshot(snapshot);

    return Card(
      margin: EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          ListTile(
            contentPadding: EdgeInsets.only(top: 8, bottom: 8, left: 8, right: 8),
            leading: Image.network(recipe.imageUrl, width: 50, fit: BoxFit.fill,),
            title: Text(recipe.name, style: Styles.headerLarge,),
            subtitle: Text(recipe.dietLabel, style: Styles.subHeaderLarge,),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RecipeDetail(recipe: snapshot,)
                ),
              );
            },
          )          
        ],
      )
    );
  }  
}