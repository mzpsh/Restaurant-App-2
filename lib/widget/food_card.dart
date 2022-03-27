import 'package:flutter/material.dart';
import 'package:submission1_restaurant_app/data/model/restaurant.dart';
import 'package:submission1_restaurant_app/widget/card_menu.dart';

class FoodCard extends StatelessWidget {
  Restaurant restaurant;

  FoodCard({Key? key, required this.restaurant}) : super(key: key);

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
          //       menu: restaurant.foods[index]['name'],
          //     );
          //   },
          //   itemCount: restaurant.foods.length,
          //   separatorBuilder: (context, index) => SizedBox(
          //     width: 10,
          //   ),
          // ),
        ),
      ],
    );
  }
}
