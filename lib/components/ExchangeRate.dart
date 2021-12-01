import 'package:flutter/material.dart';
import 'package:currency_converter/variables/constants.dart';
import 'package:provider/provider.dart';
import 'package:currency_converter/main.dart';

class ExchangeRate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          Text(
            'Exchange Rate',
            style: TextStyle(color: secondaryColor, fontSize: 20),
          ),
          Text(
            '1 ${Provider.of<Data>(context).initialCur} = ${(Provider.of<Data>(context).updatedRate==null)?'...':Provider.of<Data>(context).updatedRate} ${Provider.of<Data>(context).finalCur}',
            style: TextStyle(fontSize: 20),
          )
        ],
      ),
    );
  }
}
