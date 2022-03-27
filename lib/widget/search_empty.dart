import 'package:flutter/material.dart';

import 'package:submission1_restaurant_app/style/style.dart';

class SearchEmpty extends StatelessWidget {
  IconData icon;
  String title;
  String subtitle;

  SearchEmpty({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 50.0,
              color: primaryColor.withOpacity(0.5),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.subtitle1,
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ],
        ),
      ),
    );
  }
}
