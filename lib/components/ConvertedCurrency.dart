import 'package:flutter/material.dart';
import 'package:currency_converter/components/FromCountryCard.dart';
import 'package:currency_converter/components/ToCountryCard.dart';


class ConvertedCurrency extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: FromCountryCard(
            image: 'AUSFlag.jpeg',
            currencyAmount: '1000',
            currencyName: 'AUD',
          ),
        ),

      Icon(
        Icons.arrow_right_alt_outlined,
        size: 80,
        color: Color(0xFF3A7B1E),
      ),
      ToCountryCard(image: 'USFlag.png', currencyAmount: '730', currencyName: 'USD')

      ]);
  }
}
