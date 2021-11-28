import 'package:flutter/material.dart';
import 'package:currency_converter/variables/constants.dart';
import 'package:currency_converter/components/ConversionList.dart';

class ExchangeRate extends StatelessWidget {
 String initialCurrency;
 /////////
 ///////
 //use provider package to listen for changes to initialCurrency and finalCurrency-->
 //apply these listens to country card and exhcange rate card
 ///////
 ///////
 ///////
  final String finalCurrency;
  final String convertedAmount;

  ExchangeRate({ @required this.initialCurrency, @required this.finalCurrency,@required this.convertedAmount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          Text(
            'Exchange Rate',
            style: TextStyle(color: secondaryColor,
                fontSize: 20),
          ),
          Text('1 $initialCurrency = $convertedAmount $finalCurrency',style: TextStyle(fontSize: 20),)
        ],
      ),
    );
  }
}
