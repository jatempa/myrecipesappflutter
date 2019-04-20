import 'package:flutter/material.dart';

import 'recipe_list.dart';
import 'recipe_form.dart';

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
            return RecipeForm();
          },
        ),
      ),
    );
  }   
}
