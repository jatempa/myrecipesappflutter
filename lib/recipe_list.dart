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
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot snapshot) {
    final recipe = Recipe.fromSnapshot(snapshot);

    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.only(left: 8, bottom: 10),
          leading: Image.network(recipe.imageUrl, height: 70, width: 70),
          title: Text(recipe.name, style: Styles.headerLarge,),
          subtitle: RichText(
            maxLines: 3,
            text: TextSpan(
              text: recipe.description,
              style: Styles.textDefault,
            ),
          ),
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
}