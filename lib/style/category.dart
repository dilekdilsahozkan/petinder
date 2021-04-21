import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/cupertino.dart';

List<BoxShadow> shadowList = [
  BoxShadow(color: Colors.grey[300], blurRadius: 30, offset: Offset(0, 10))
];

class Category{
  final int categoryId;
  final String name;
  final IconData icon;

  Category({this.categoryId, this.name, this.icon});
}

final allCategory = Category(
  categoryId: 0,
  name: "All",
  icon: FontAwesomeIcons.search,
);

final catsCategory = Category(
  categoryId: 1,
  name: "Cats",
  icon: FontAwesomeIcons.cat,
);

final dogsCategory = Category(
  categoryId: 2,
  name: "Dogs",
  icon: FontAwesomeIcons.dog,
);

final birdsCategory = Category(
  categoryId: 3,
  name: "Birds",
  icon: FontAwesomeIcons.kiwiBird,
);


final categories = [
  allCategory,
  catsCategory,
  dogsCategory,
  birdsCategory,
];