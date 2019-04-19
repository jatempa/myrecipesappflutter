import 'package:flutter/material.dart';

import 'recipe_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(63,81,181, 1)
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _formKey = GlobalKey<FormState>();
  List<String> labels = ['High-Fat', 'Low-Fat', 'Low-Carb', 'Low-Sodium', 'Medium-Carb', 'Vegetarian', 'Balanced'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Recipes')),
      body: RecipeList(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Color.fromRGBO(63,81,181, 1),
        onPressed: () => showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Create a recipe'),
              content: Form(
                autovalidate: true,
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Enter the recipe name',
                          labelText: 'Name',
                        ),                    
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Enter the recipe description',
                          labelText: 'Description',
                        ),                    
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Enter the URL image',
                          labelText: 'Image',
                        ),                    
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                        },
                      )
                    ]
                  )
                )
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text('Ok'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }   
}
