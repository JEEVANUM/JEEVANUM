import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:currency_converter/main.dart';


class ToCountryCard extends StatelessWidget {
  final String image;
  final String currencyAmount;
  final String currencyName;

  ToCountryCard({ @required this.image, @required this.currencyAmount,@required this.currencyName});

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
        Text('${(Provider.of<Data>(context).outputAmount==null )?'0':Provider.of<Data>(context).outputAmount } ${(Provider.of<Data>(context).finalCurDisplay==null)?'USD':Provider.of<Data>(context).finalCurDisplay}',style: TextStyle(
            fontSize: 20
        ),)
      ],
    );
  }
}
