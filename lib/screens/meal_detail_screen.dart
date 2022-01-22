import 'package:flutter/material.dart';

import '../models/screen_arguments.dart';
import '../dummy_data.dart';

class MealDetail extends StatelessWidget {
  static const routeName = '/meal-setail';
  const MealDetail({Key? key}) : super(key: key);

  Widget getTitle(context, title) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }

  Widget getBox(Widget child) {
    return Container(
      height: 150,
      width: 300,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.black45,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    final selectedMeal =
        DUMMY_MEALS.firstWhere((meal) => meal.id == routeArgs.id);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      backgroundColor: Theme.of(context).colorScheme.secondaryVariant,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              selectedMeal.imageUrl,
              fit: BoxFit.cover,
            ),
            getTitle(context, 'Ingredients'),
            getBox(ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  child: Text(selectedMeal.ingredients[index]),
                  color: Theme.of(context).colorScheme.secondary,
                  // elevation: 15,
                );
              },
              itemCount: selectedMeal.ingredients.length,
            )),
            const SizedBox(
              height: 30,
              width: double.infinity,
            ),
            getTitle(context, 'Steps'),
            getBox(ListView.builder(
              itemBuilder: (ctx, index) {
                return Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('#${index + 1}',
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Colors.white,
                            )),
                        backgroundColor: Colors.purple,
                      ),
                      subtitle: Text(selectedMeal.steps[index]),
                    ),
                    const Divider(),
                  ],
                );
              },
              itemCount: selectedMeal.steps.length,
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.delete),
        onPressed: () {
          Navigator.of(context).pop(routeArgs.id);
        },
      ),
    );
  }
}
