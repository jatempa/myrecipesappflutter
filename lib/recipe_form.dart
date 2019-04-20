import 'package:flutter/material.dart';

class RecipeForm extends StatefulWidget {
  @override
  RecipeFormState createState() => RecipeFormState();
}

class RecipeFormState extends State<RecipeForm> {
  final List<String> labels = ['High-Fat', 'Low-Fat', 'Low-Carb', 'Low-Sodium', 'Medium-Carb', 'Vegetarian', 'Balanced'];
  final _formKey = GlobalKey<FormState>();
  String name;
  String description;
  String urlImage;
  String dietLabelSelected = 'High-Fat';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Create a recipe'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter the recipe name',
                  labelText: 'Name',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a name';
                  }
                },
                onSaved: (value) {
                  setState(() => name = value);
                }
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter the recipe description',
                  labelText: 'Description',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a description';
                  }
                },                
                onSaved: (value) {
                  setState(() => description = value);
                }
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter the recipe url image',
                  labelText: 'Image',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a url image';
                  }
                },                
                onSaved: (value) {
                  setState(() => urlImage = value);
                }
              ),
              DropdownButtonFormField<String>(
                value: dietLabelSelected,
                decoration: InputDecoration(
                  hintText: 'Enter the diet label',
                  labelText: 'Diet Label',
                ),
                items: labels.map((label) => DropdownMenuItem(
                  child: Text(label),
                  value: label,
                )).toList(),
                onChanged: (value) {
                  setState(() => dietLabelSelected = value);
                }
              ),
            ]
          )
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('Save'),
          onPressed: () {
            if (_formKey.currentState.validate()) {
              _formKey.currentState.save();
              print("$name");
              print("$description");
              print("$urlImage");
              print("$dietLabelSelected");
              Navigator.of(context).pop();
            }
          },
        ),
      ]
    );
  }
}
