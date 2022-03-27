import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:submission1_restaurant_app/style/style.dart';
import 'package:submission1_restaurant_app/widget/search_empty.dart';
import 'package:submission1_restaurant_app/widget/search_loading.dart';
import 'package:submission1_restaurant_app/widget/card_list_restaurant.dart';
import 'package:submission1_restaurant_app/data/provider/search_restaurant_provider.dart';
import 'package:submission1_restaurant_app/data/api/api_service.dart';

class SearchPage extends StatelessWidget {
  static const routeName = '/search_screen';
  const SearchPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SearchRestaurantProvider>(
      create: (_) => SearchRestaurantProvider(apiService: ApiService()),
      child: Scaffold(
        body: BodySearchPage(),
      ),
    );
  }
}

class BodySearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final searchProvider =
        Provider.of<SearchRestaurantProvider>(context, listen: false);
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          top: 20.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0, bottom: 10.0),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  size: 24.0,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    "Search",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  Text(
                    "Search the restaurant you want",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: TextField(
                          cursorColor: secondaryColor,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            fillColor: primaryColor.withOpacity(0.05),
                            filled: true,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            prefixIcon: Icon(
                              Icons.search,
                              color: secondaryColor,
                              size: 20,
                            ),
                            hintText: "Search Restaurant",
                          ),
                          style: TextStyle(fontSize: 14),
                          onSubmitted: (value) {
                            searchProvider.addSearchKey(value);
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Consumer<SearchRestaurantProvider>(
              builder: (context, result, _) {
                if (result.state == ResultState.NoKey) {
                  return SearchEmpty(
                    icon: Icons.search,
                    title: "Type what restaurant",
                    subtitle: "you want to search",
                  );
                } else if (result.state == ResultState.Loading) {
                  return SearchLoading(
                    title: "Please Wait",
                    subtitle: "Looking for a restaurant ",
                  );
                } else if (result.state == ResultState.HasData) {
                  return Expanded(
                    child: ListView.separated(
                      padding: EdgeInsets.only(
                        bottom: 40.0,
                        left: 20.0,
                        right: 20.0,
                      ),
                      shrinkWrap: true,
                      itemCount: result.searchRestaurant.restaurants.length,
                      itemBuilder: (context, index) {
                        var restaurant =
                            result.searchRestaurant.restaurants[index];
                        return CardListRestaurant(
                          restaurant: restaurant,
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(
                        height: 10,
                      ),
                    ),
                  );
                } else if (result.state == ResultState.NoData) {
                  return SearchEmpty(
                    icon: Icons.search_off,
                    title: "Keyword not found",
                    subtitle: "Please enter another keyword",
                  );
                } else if (result.state == ResultState.Error) {
                  return SearchEmpty(
                    icon: Icons.cloud_off_sharp,
                    title: "Failed to load restaurant data ",
                    subtitle: "Please check your internet connection ",
                  );
                } else {
                  return Center(child: Text(''));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
