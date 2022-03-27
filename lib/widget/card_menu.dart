import 'package:flutter/material.dart';

class CardMenu extends StatelessWidget {
  final String menu;
  // Restaurant restaurant;

  CardMenu({Key? key, required this.menu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Expanded(
              child: Image.asset('assets/hamburger.jpg'),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(menu),
          Text(
            "IDR 50.000",
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}
