import 'package:flutter/material.dart';
import './screens/tabs_screen.dart';
import 'screens/category_meals_screen.dart';
import 'screens/categories_screen.dart';
import 'screens/meal_detail.scree.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.black,//swipe color when there is nothing to swip
        canvasColor: Color.fromRGBO(255, 254, 229, 1),//background color
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          title: TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          )
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //home: CategoriesScreen(),//MyHomePage(),
      initialRoute: '/',//this is its default value
      routes: {
        '/': (ctx)=>TabsScreen(),//CategoriesScreen(),// this line and 'home: CategoriesScreen()' is same
        CategoryMealsScreen.routeName: (ctx)=>CategoryMealsScreen(),
        MealDetailScreen.routName:(ctx)=>MealDetailScreen(),
      },
      onUnknownRoute: (settings) {//if route o a page is not defined this gets executed and takes back to home screen
        return MaterialPageRoute(builder: (ctx)=>CategoriesScreen());
      },
    );
  }
}

/*class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DailyMeals'),
      ),
      body: Center(
        child: Text('Navigation time!'),
      ),
    );
  }
}*/
