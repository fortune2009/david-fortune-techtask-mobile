import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_task/providers/ingredient_provider.dart';
import 'package:tech_task/providers/recipe_provider.dart';
import 'package:tech_task/screens/ingredients.dart';
import 'package:tech_task/screens/lunch_date.dart';
import 'package:tech_task/screens/recipes.dart';
import 'package:tech_task/services/api_services.dart';
import 'package:tech_task/services/interface_api_services.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RecipeProvider(apiServices: ApiServices())),
        ChangeNotifierProvider(create: (_) => IngredientProvider(apiServices: ApiServices())),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recipe App',
      initialRoute: '/lunch-date', // Set the initial route
      routes: {
        '/lunch-date': (context) => LunchDateScreen(),
        '/ingredients': (context) => IngredientsScreen(),
        '/recipes': (context) => RecipesScreen(),
      },
      // title: 'Flutter Demo',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
      // home: LunchDateScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
