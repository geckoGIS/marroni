import 'package:flutter/material.dart';

import 'package:marroni_google/model/ways.dart';
import 'package:marroni_google/ui/widgets/ways_card.dart';
import 'package:marroni_google/utils/marroni_ways.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  // New member of the class:
  List<Recipe> recipes = getRecipes();


  // New method:
  // Inactive widgets are going to call this method to
  // signalize the parent widget HomeScreen to refresh the list view.


  @override
  Widget build(BuildContext context) {
    // New method:
    Column _buildRecipes(List<Recipe> recipesList) {
      return Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: recipesList.length,
              itemBuilder: (BuildContext context, int index) {
                // New code:
                return new RecipeCard(
                  recipe: recipesList[index],
                );
              },
            ),
          ),
        ],
      );
    }

    const double _iconSize = 20.0;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          // We set Size equal to passed height (50.0) and infinite width:
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            backgroundColor: Colors.white,
            elevation: 2.0,
            bottom: TabBar(
              labelColor: Theme.of(context).indicatorColor,
              tabs: [
                Tab(icon: Icon(Icons.map, size: _iconSize)),
                Tab(icon: Icon(Icons.dehaze, size: _iconSize)),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(5.0),
          child: TabBarView(
            // Replace placeholders:
            children: [
              // Display recipes of type food:
              _buildRecipes(recipes
                  .where((recipe) => recipe.type == RecipeType.food)
                  .toList()),
              // Display recipes of type drink:
              _buildRecipes(recipes
                  .where((recipe) => recipe.type == RecipeType.drink)
                  .toList()),
            ],
          ),
        ),
      ),
    );
  }
}