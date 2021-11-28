import 'package:flutter/material.dart';


class CountryCard extends StatelessWidget {
  final String image;
  final String currencyAmount;
  final String currencyName;

  CountryCard({ @required this.image, @required this.currencyAmount,@required this.currencyName});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 35,
          backgroundImage: AssetImage(
              'assets/$image'),
        ),
        SizedBox(
          height: 10,
        ),
        Text('$currencyAmount $currencyName',style: TextStyle(
            fontSize: 20
        ),)
      ],
    );
  }
}
