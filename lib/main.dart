import 'package:flutter/material.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/tabs_bar_screen.dart';
import './screens/meal_detail_screen.dart';
// import './screens/categories_screen.dart';
import './screens/category_meal_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSwatch(primarySwatch: Colors.pink).copyWith(
          secondary: Colors.amber,
          secondaryVariant: const Color.fromRGBO(255, 254, 229, 1),
          primary: Colors.pink,
        ),
        fontFamily: 'Raleway',
        textTheme: const TextTheme(
            bodyText1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyText2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            subtitle1: TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold
            )),
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => const TabsBarScreen(),
        CategoryMealScreen.routeName: (ctx) => const CategoryMealScreen(),
        MealDetail.routeName: (ctx) => const MealDetail(),
        FiltersScreen.routeName: (ctx) => const FiltersScreen()
      },
      onGenerateRoute: (settings) {
        // print(settings);
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => const CategoryMealScreen());
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DeliMeals'),
      ),
      body: const Center(
        child: Text('Navigation Time!'),
      ),
    );
  }
}
