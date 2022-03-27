import 'package:flutter/material.dart';
import 'package:submission1_restaurant_app/data/model/restaurant.dart';
import 'package:submission1_restaurant_app/ui/splash_screen.dart';
import 'package:submission1_restaurant_app/ui/restaurant_list_page.dart';
import 'package:submission1_restaurant_app/ui/detail_restaurant_page.dart';
import 'package:submission1_restaurant_app/style/style.dart';
import 'package:submission1_restaurant_app/ui/search_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant App',
      theme: ThemeData(
        textTheme: myTextTheme,
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: primaryColor,
              onPrimary: Colors.black,
              secondary: secondaryColor,
            ),
        // primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: SplashScreen.routeName,
      routes: {
        RestaurantListPage.routeName: (context) => RestaurantListPage(),
        DetailRestaurantPage.routeName: (context) => DetailRestaurantPage(
              restaurant_id:
                  ModalRoute.of(context)?.settings.arguments as String,
            ),
        SplashScreen.routeName: (context) => SplashScreen(),
        SearchPage.routeName: (context) => SearchPage(),
      },
    );
  }
}
