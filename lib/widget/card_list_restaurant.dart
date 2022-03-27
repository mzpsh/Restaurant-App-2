import 'package:flutter/material.dart';
import 'package:submission1_restaurant_app/ui/detail_restaurant_page.dart';
import 'package:submission1_restaurant_app/data/model/restaurant.dart';
import 'package:submission1_restaurant_app/style/style.dart';

class CardListRestaurant extends StatelessWidget {
  Restaurant restaurant;

  CardListRestaurant({Key? key, required this.restaurant}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () {
        Navigator.pushNamed(
          context,
          DetailRestaurantPage.routeName,
          arguments: restaurant.id,
        );
      },
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Flexible(
                child: Container(
                  padding: const EdgeInsets.only(right: 30),
                  child: Expanded(
                    child: Hero(
                      tag: restaurant.pictureId,
                      child: Image.network(
                        "https://restaurant-api.dicoding.dev/images/small/${restaurant.pictureId}",
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      restaurant.name,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_sharp,
                          size: 12,
                          color: secondaryColor,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(restaurant.city),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          size: 12,
                          color: secondaryColor,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(restaurant.rating.toString()),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}
