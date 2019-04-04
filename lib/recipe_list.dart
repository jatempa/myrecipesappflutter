import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'recipe.dart';
import 'recipe_detail.dart';
import 'styles.dart';

class RecipeList extends StatefulWidget {
  RecipeListState createState() => RecipeListState();
}

class RecipeListState extends State<RecipeList> {
  Future _recipes;

  Future getRecipes() async {
    var firestore = Firestore.instance;

    QuerySnapshot qn = await firestore.collection('recipes').getDocuments();

    return qn.documents;
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _recipes = getRecipes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _recipes,
      builder: (_, snapshot) {
        if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
        return _buildList(context, snapshot.data);
      }
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot snapshot) {
    final recipe = Recipe.fromSnapshot(snapshot);

    return Column(
      children: [
        ListTile(
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
          trailing: Text(recipe.dietLabel, style: TextStyle(fontFamily: 'JosefinSans', fontSize: 12, fontWeight: FontWeight.bold, color: getColorByLabel(recipe.dietLabel))),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RecipeDetail(snapshot)
              ),
            );
          },
        ),
        Divider(height: 30,),
      ],
    );
  }  

  Color getColorByLabel(String label) {
    switch (label) {
      case "Low-Fat":
        return Styles.colorLowFat;
      case "Low-Carb":
        return Styles.colorLowCarb;
      case "Low-Sodium":
        return Styles.colorLowSodium;
      case "Medium-Carb":
        return Styles.colorMediumCarb;
      case "Vegetarian":
        return Styles.colorVegetarian;
      case "Balanced":
        return Styles.colorBalanced;
    }
  }
}