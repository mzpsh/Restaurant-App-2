import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:submission1_restaurant_app/style/style.dart';
import 'package:submission1_restaurant_app/widget/card_list_restaurant.dart';
import 'package:submission1_restaurant_app/data/provider/list_restaurant_provider.dart';
import 'package:submission1_restaurant_app/data/api/api_service.dart';
import 'package:submission1_restaurant_app/widget/search_loading.dart';
import 'package:submission1_restaurant_app/ui/search_page.dart';

class RestaurantListPage extends StatelessWidget {
  static const routeName = '/restaurant_list_page';

  RestaurantListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return ChangeNotifierProvider<RestaurantListProvider>(
            create: (_) => RestaurantListProvider(apiService: ApiService()),
            child: SafeArea(
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              SearchPage.routeName,
                            );
                          },
                          icon: Icon(
                            Icons.search,
                            size: 24.0,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Restaurant App',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Recommendation restauran for you!',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    //Kolom Search
                    // Row(
                    //   children: [
                    //     Expanded(
                    //       child: TextField(
                    //         cursorColor: secondaryLightColor,
                    //         decoration: InputDecoration(
                    //           contentPadding: EdgeInsets.symmetric(
                    //             horizontal: 16,
                    //             vertical: 8,
                    //           ),
                    //           border: OutlineInputBorder(
                    //             borderRadius: BorderRadius.circular(8),
                    //             borderSide: BorderSide.none,
                    //           ),
                    //           filled: true,
                    //           prefixIcon: Icon(
                    //             Icons.search_rounded,
                    //             color: secondaryColor,
                    //             size: 20,
                    //           ),
                    //           hintText: "nama restoran, lokasi ...",
                    //         ),
                    //       ),
                    //     ),
                    //     SizedBox(
                    //       width: 10,
                    //     ),
                    //     ElevatedButton(
                    //       onPressed: () {},
                    //       child: Text(
                    //         "Search",
                    //         style: Theme.of(context).textTheme.button,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    SizedBox(
                      height: 25,
                    ),
                    Consumer<RestaurantListProvider>(
                      builder: (context, state, _) {
                        if (state.state == ResultState.Loading) {
                          return SearchLoading(
                            title: "Please Wait",
                            subtitle: "Is loading restaurant list",
                          );
                        } else if (state.state == ResultState.HasData) {
                          return Expanded(
                            child: ListView.separated(
                              padding: EdgeInsets.only(
                                bottom: 40.0,
                                left: 20.0,
                                right: 20.0,
                              ),
                              shrinkWrap: true,
                              itemCount:
                                  state.restaurantList.restaurants.length,
                              itemBuilder: (context, index) {
                                var restaurant =
                                    state.restaurantList.restaurants[index];
                                return CardListRestaurant(
                                  restaurant: restaurant,
                                );
                              },
                              separatorBuilder: (context, index) => SizedBox(
                                height: 10,
                              ),
                            ),
                          );
                        } else if (state.state == ResultState.NoData) {
                          return Center(
                            child: Text(
                              'error1',
                            ),
                          );
                          // SearchEmpty(
                          //   icon: Icons.restaurant_menu,
                          //   title: "No restaurant list ",
                          //   subtitle: "",
                          // );
                        } else if (state.state == ResultState.Error) {
                          return Center(
                            child: Text(
                              'Coba periksa koneksi internet anda',
                            ),
                          );
                          // SearchEmpty(
                          //   icon: Icons.cloud_off_sharp,
                          //   title: "Failed to load restaurant data ",
                          //   subtitle: "Please check your internet connection ",
                          // );
                        } else {
                          return Center(child: Text(''));
                        }
                      },
                    ),
                    // Expanded(
                    //   child: FutureBuilder<String>(
                    //     future: DefaultAssetBundle.of(context)
                    //         .loadString('assets/local_restaurant.json'),
                    //     builder: (context, snapshot) {
                    //       if (snapshot.hasError) {
                    //         return Text("Gagal menampilkan data");
                    //       } else if (snapshot.hasData) {
                    //         final List<Restaurant> restaurant =
                    //             parseArticles(snapshot.data);
                    //         return ListView.builder(
                    //           itemCount: restaurant.length,
                    //           itemBuilder: (context, index) {
                    //             return _buildRestaurantItem(
                    //                 context, restaurant[index]);
                    //           },
                    //         );
                    //       }
                    //       return Container();
                    //     },
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // Widget _buildRestaurantItem(BuildContext context, Restaurant restaurant) {
  //   return CardListRestaurant(
  //     restaurant: restaurant,
  //   );
  // }
}
