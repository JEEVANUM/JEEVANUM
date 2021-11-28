import 'package:currency_converter/variables/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:currency_converter/variables/Coin_Data.dart';

class ConversionList extends StatefulWidget {
  @override
  _ConversionListState createState() => _ConversionListState();
}

class _ConversionListState extends State<ConversionList> {
String From = 'AUD';
 String To='USD';
String currencyRate;
  void getData() async{
    try{double rate=await CoinData(baseCurrency: From,finalCurrency: To).getCoinData();

    currencyRate=rate.toStringAsFixed(3);
    print(currencyRate);

    }catch(e){print(e);}
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'From',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Container(
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(30)),
                child: Center(
                  child: DropdownButton<String>(
                      value: From,
                      items: currenciesList
                          .map((e) =>
                              (DropdownMenuItem(child: Text(e), value: e)))
                          .toList(),
                  onChanged: (value) {
                    setState(() {
                      From = value;
                    });
                  },
                ),
              ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'To',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Container(
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(30)
                ),
                child: Center(
                  child: DropdownButton<String>(
                    value: To,
                    items: currenciesList.map((e) => (DropdownMenuItem(child: Text(e),value: e))).toList(),
                    onChanged: (value){
                      setState(() {
                        To=value;
                      });
                    },
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: TextField(
            decoration: InputDecoration(
              
                hintText: 'Amount', border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30)
            )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Container(
            width: 300,
            decoration: BoxDecoration(
                color: secondaryColor, borderRadius: BorderRadius.circular(30)),
            child: TextButton(
              onPressed: () {
                print('From: $From');
                print('To: $To');
                getData();
              },
              child: Text(
                'Convert',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
        ),

      ],
    );
  }
}
