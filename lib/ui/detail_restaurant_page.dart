import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:submission1_restaurant_app/data/model/restaurant.dart';
import 'package:submission1_restaurant_app/style/style.dart';
import 'package:submission1_restaurant_app/widget/drink_card.dart';
import 'package:submission1_restaurant_app/widget/food_card.dart';
import 'package:submission1_restaurant_app/data/model/detail_restaurant.dart';
import 'package:submission1_restaurant_app/data/api/api_service.dart';
import 'package:submission1_restaurant_app/data/provider/detail_restaurant_provider.dart';
import 'package:submission1_restaurant_app/widget/search_empty.dart';
import 'package:submission1_restaurant_app/widget/search_loading.dart';

class DetailRestaurantPage extends StatelessWidget {
  static const routeName = '/detail_restaurant_page';
  final String restaurant_id;

  DetailRestaurantPage({required this.restaurant_id});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DetailRestaurantProvider>(
      create: (_) => DetailRestaurantProvider(
          apiService: ApiService(), idRestaurant: restaurant_id),
      child: BodyDetailRestaurantPage(),
    );
  }
}

class BodyDetailRestaurantPage extends StatelessWidget {
  const BodyDetailRestaurantPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<DetailRestaurantProvider>(
        builder: (context, state, _) {
          if (state.state == ResultState.HasData) {
            return Center(
              /// Jangan panggil state.detailRestaurant
              /// juga jangan panggil state keseluruhan
              /// diluar ResultState.HasData
              child: Text('ada data' + state.detailRestaurant.toString()),
            );
          } else if (state.state == ResultState.Error) {
            return Center(
              child: Text('error: ${state.message}'),
            );
          } else {
            return Center(
              child: Text('loading'),
            );
          }

          // return ContentDetailRestaurantPage(
          //   state: state,
          // );

          // if (state.state == ResultState.Loading) {
          //   return Column(
          //     children: [
          //       SearchLoading(
          //         title: "Please Wait",
          //         subtitle: "Loading restaurant data",
          //       ),
          //     ],
          //   );
          // } else if (state.state == ResultState.HasData) {
          //   return ContentDetailRestaurantPage(
          //     state: state,
          //   );
          // } else if (state.state == ResultState.NoData) {
          //   return Column(
          //     children: [
          //       SearchEmpty(
          //         icon: Icons.restaurant_menu,
          //         title: "No restaurant list ",
          //         subtitle: "",
          //       ),
          //     ],
          //   );
          // } else if (state.state == ResultState.Error) {
          //   return Column(
          //     children: [
          //       SearchEmpty(
          //         icon: Icons.cloud_off_sharp,
          //         title: state.message,
          //         subtitle: "Please check your internet connection ",
          //       ),
          //     ],
          //   );
          // } else {
          //   return Center(child: Text(''));
          // }
        },
      ),
    );
  }
}

class ContentDetailRestaurantPage extends StatelessWidget {
  DetailRestaurantProvider state;

  ContentDetailRestaurantPage({required this.state});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: <Widget>[
                      Hero(
                        tag: state.detailRestaurant.restaurant.pictureId,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            "https://restaurant-api.dicoding.dev/images/large/${state.detailRestaurant.restaurant.pictureId}",
                          ),
                        ),
                      ),
                      SafeArea(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.transparent,
                              child: IconButton(
                                icon: const Icon(Icons.arrow_back),
                                color: secondaryColor,
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.detailRestaurant.restaurant.name,
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.location_on_sharp,
                              size: 20,
                              color: primaryTextcolor.withOpacity(0.3),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Text(
                              state.detailRestaurant.restaurant.address +
                                  ", " +
                                  state.detailRestaurant.restaurant.city,
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          'Description',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          state.detailRestaurant.restaurant.description,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          'Food',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        // FoodCard(
                        //   restaurant: restaurant,
                        // ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Drink',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        // DrinkCard(
                        //   restaurant: restaurant,
                        // ),
                        SizedBox(
                          height: 8,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
