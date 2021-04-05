import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail-screen';

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        //border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      //margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) {
      return meal.id == mealId;
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(mealId),
      ),
      body: Column(
        children: [
          Image.network(selectedMeal.imageUrl),
          Card(
            elevation: 5,
            child: buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) {
                  return Container(
                    color: Theme.of(context).accentColor,
                    padding: EdgeInsets.all(10),
                    child: Text(selectedMeal.ingredients[index]),
                  );
                },
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
          ),
          Card(
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) {
                  return Container(
                    color: Theme.of(context).accentColor,
                    padding: EdgeInsets.all(10),
                    child: Text('-' + selectedMeal.steps[index]),
                  );
                },
                itemCount: selectedMeal.steps.length,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () {
          Navigator.of(context).pop(mealId);
        },
      ),
    );
  }
}
