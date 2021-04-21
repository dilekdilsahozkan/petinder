import 'package:flutter/material.dart';
import 'package:petinder/events/app_state.dart';
import 'package:petinder/style/category.dart';
import 'package:petinder/style/styleguid.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';

class CategoryWidget extends StatelessWidget {

  final Category category;

  const CategoryWidget({Key key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final themeData = Theme.of(context);
    final appState = Provider.of<AppState>(context);
    final isSelected = appState.selectedCategoryId == category.categoryId;

    return GestureDetector(
      onTap: () {
        if (!isSelected){
          appState.updateCategoryId(category.categoryId);
        }
      },
          child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        width: 90,
        height: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(24)),
          gradient: isSelected ? LinearGradient(colors: [
            Theme.of(context).primaryColor,
            themeData.scaffoldBackgroundColor
          ], begin: Alignment.bottomRight, end: Alignment.topLeft) : LinearGradient(colors: [
            Colors.transparent,
            Colors.transparent
          ], begin: Alignment.bottomRight, end: Alignment.topLeft)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(category.icon, color: Colors.black, size: 40,),
            SizedBox(height: 10,),
            Text(category.name, style: categoryTextStyle,)
          ],
        ),
      ),
    );
  }
}