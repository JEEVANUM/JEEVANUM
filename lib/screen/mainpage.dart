import 'package:currency_converter/components/ConvertedCurrency.dart';
import 'package:currency_converter/components/ReusableCard.dart';
import 'package:flutter/material.dart';
import 'package:currency_converter/components/ExchangeRate.dart';
import 'package:currency_converter/components/ConversionList.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            child: Text(
              'Currency Converter',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          ReusableCard(cardChild: ConvertedCurrency()),
          SizedBox(
            height: 15,
          ),
          ReusableCard(
              cardChild: ExchangeRate(
            initialCurrency: 'AUD',
            finalCurrency: 'USD',
            convertedAmount: '0.73',
          )),
          SizedBox(
            height: 15,
          ),
          ReusableCard(cardChild: ConversionList()),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 150,
                  child: Text('Designed and built by Vincent Chen',style: TextStyle(color: Colors.white), textAlign:TextAlign.center,)),
              SizedBox(width: 30,),
              CircleAvatar(backgroundImage:AssetImage('assets/portrait.jpg'),maxRadius: 35,),

            ],
          )
        ],
      ),
    );
  }
}

