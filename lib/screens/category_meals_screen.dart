import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import '../widgets/meal_item.dart';
class CategoryMealsScreen extends StatelessWidget {
  static const routeName='/category-meals';
  /*final String categoryId;
  final String categoryTitle;*/

  //CategoryMealsScreen(this.categoryId,this.categoryTitle);

  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  Widget build(BuildContext context) {
    final routeArgs=ModalRoute.of(context).settings.arguments as Map <String,String>;
    final String categoryId=routeArgs['id'];
    final String categoryTitle=routeArgs['title'];
    final categoryMeals= availableMeals.where((meal){ 
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(itemBuilder: (ctx,index) {
        return MealItem(
          id:categoryMeals[index].id,
          title:categoryMeals[index].title,
          imageUrl:categoryMeals[index].imageUrl,
          duration: categoryMeals[index].duration,
          affordability: categoryMeals[index].affordability,
          complexity: categoryMeals[index].complexity,
        );
      },itemCount: categoryMeals.length,)
    );
  }
}