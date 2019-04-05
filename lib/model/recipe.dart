import 'package:cloud_firestore/cloud_firestore.dart';

class Recipe {
  final String name;
  final String description;
  final String imageUrl;
  final String dietLabel;
  final List<dynamic> ingredients;
  final DocumentReference reference;

  Recipe.fromMap(Map<String, dynamic> map, {this.reference}) 
    : assert(map['title'] != null),
      assert(map['description'] != null),
      assert(map['image'] != null),
      assert(map['dietLabel'] != null),
      assert(map['ingredientLines'] != null),
      name = map['title'],
      description = map['description'],
      imageUrl = map['image'],
      dietLabel = map['dietLabel'],
      ingredients = map['ingredientLines'];
  
  Recipe.fromSnapshot(DocumentSnapshot snapshot)
    : this.fromMap(snapshot.data, reference: snapshot.reference);
  
  @override
  String toString() => "Recipe<$name>";
}