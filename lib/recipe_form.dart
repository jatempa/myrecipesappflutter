import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RecipeForm extends StatefulWidget {
  @override
  RecipeFormState createState() => RecipeFormState();
}

class RecipeFormState extends State<RecipeForm> {
  final List<String> labels = ['High-Fat', 'Low-Fat', 'Low-Carb', 'Low-Sodium', 'Medium-Carb', 'Vegetarian', 'Balanced'];
  final _formKey = GlobalKey<FormState>();
  Map<String, String> recipeValues = {
    'title': '',
    'description': '',
    'image': '',
    'dietLabel': 'High-Fat'
  };

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Create a recipe'),
      content: buildRecipeForm(),
      actions: <Widget>[
        FlatButton(
          child: Text('Save'),
          onPressed: () => createRecipe(),
        ),
      ]
    );
  }

  Form buildRecipeForm() {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            buildTextFormField('Enter the recipe name', 'Name', 'a name', 'name'),
            buildTextFormField('Enter the recipe description', 'Description', 'the description', 'description'),
            buildTextFormField('Enter the recipe url image', 'Image', 'url image', 'image'),
            DropdownButtonFormField<String>(
              value: recipeValues['dietLabel'],
              decoration: InputDecoration(
                hintText: 'Enter the diet label',
                labelText: 'Diet Label',
              ),
              items: labels.map((label) => DropdownMenuItem(
                child: Text(label),
                value: label,
              )).toList(),
              onChanged: (value) {
                setState(() => recipeValues['dietLabel'] = value);
              }
            ),
          ]
        )
      ),
    );
  }

  TextFormField buildTextFormField(String hint, String label, String error, String key) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hint,
        labelText: label,
      ),
      validator: (value) {
        if (value.isEmpty) {
          return "Please enter $error";
        }
      },
      onSaved: (value) {
        setState(() => recipeValues[key] = value);
      }
    );    
  }
 
  void createRecipe() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print("$recipeValues");
      DocumentReference ref = await Firestore.instance.collection('recipes').add(recipeValues);
      print(ref.documentID);
      Navigator.of(context).pop();
    }    
  }
}
