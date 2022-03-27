import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:submission1_restaurant_app/data/model/restaurant.dart';
import 'package:submission1_restaurant_app/widget/card_menu.dart';

class DrinkCard extends StatelessWidget {
  Restaurant restaurant;

  DrinkCard({Key? key, required this.restaurant}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 170,
          // child: ListView.separated(
          //   scrollDirection: Axis.horizontal,
          //   itemBuilder: (context, index) {
          //     return CardMenu(
          //       menu: restaurant.drinks[index]['name'],
          //     );
          //   },
          //   itemCount: restaurant.drinks.length,
          //   separatorBuilder: (context, index) => SizedBox(width: 12),
          // ),
        ),
      ],
    );
  }
}
