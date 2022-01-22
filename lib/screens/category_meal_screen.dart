import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';
import '../models/screen_arguments.dart';
import '../dummy_data.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routeName = '/categories-meals';

  const CategoryMealScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  List<Meal> displayMeals = [];
  String categoryTitle = "";
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!isLoaded) {
      final routeArgs =
          ModalRoute.of(context)!.settings.arguments as ScreenArguments;
      categoryTitle = routeArgs.title;

      displayMeals = DUMMY_MEALS.where((element) {
        return element.categories.contains(routeArgs.id);
      }).toList();
      isLoaded = true;
    }

    super.didChangeDependencies();
  }

  void removeItem(id) {
    if (id != null) {
      setState(() {
        displayMeals.removeWhere((meal) => meal.id == id);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: displayMeals[index].id,
            title: displayMeals[index].title,
            imageUrl: displayMeals[index].imageUrl,
            duration: displayMeals[index].duration,
            complexity: displayMeals[index].complexity,
            affordability: displayMeals[index].affordability,
            removeItem: removeItem,
          );
        },
        itemCount: displayMeals.length,
      ),
    );
  }
}
