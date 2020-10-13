import 'package:flutter/material.dart';
import '../dummy_data.dart';
class MealDetailScreen extends StatelessWidget {
  static const routName='/meal-detail'; 

  Widget buildSectiontTitle(BuildContext context,String text) {
    return Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(text,style: Theme.of(context).textTheme.title,),
          );
  }

  Widget buildContainer(Widget child) {
    return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border:Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            height: 200,
            width: 300,
            child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId=ModalRoute.of(context).settings.arguments as String;
    final selectedMeal=DUMMY_MEALS.firstWhere((meal){
      return meal.id==mealId;
    });
    return Scaffold(
      appBar: AppBar(title: Text('${selectedMeal.title}'),),
      body: SingleChildScrollView(
              child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectiontTitle(context,'Ingredients'),
            buildContainer(ListView.builder(itemBuilder: (ctx,index) {
                return Card(
                  color: Colors.amber,
                  child: Padding(padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10), child: Text(selectedMeal.ingredients[index])),
                );
              },
              itemCount: selectedMeal.ingredients.length,),
              ),
              buildSectiontTitle(context,'Steps'),
            buildContainer(ListView.builder(itemBuilder: (ctx,index){
              return ListTile(
                leading: CircleAvatar(
                  child: Text('# ${(index+1)}'),
                ),
                title: Text(selectedMeal.steps[index]),
              );
            },itemCount:selectedMeal.steps.length
            ),),
          ],
        ),
      )
    );
  }
}