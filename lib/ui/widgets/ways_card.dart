
import 'package:flutter/material.dart';

import 'package:marroni_google/model/ways.dart';
import 'package:marroni_google/ui/screens/detail.dart';
import 'package:marroni_google/ui/widgets/ways_title.dart';
import 'package:marroni_google/ui/widgets/ways_image.dart';


class RecipeCard extends StatelessWidget {
  final Recipe recipe;

  RecipeCard(
      {@required this.recipe,
      }
  );


  @override
  Widget build(BuildContext context) {


    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => new DetailScreen(recipe),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // We overlap the image and the button by
              // creating a Stack object:
              Stack(
                children: <Widget>[
                  RecipeImage(recipe.imageURL),
                ],
              ),
              RecipeTitle(recipe, 15),
            ],
          ),
        ),
      ),
    );
  }
}