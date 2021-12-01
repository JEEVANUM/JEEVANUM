import 'package:currency_converter/variables/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:currency_converter/variables/Coin_Data.dart';
import 'package:provider/provider.dart';
import 'package:currency_converter/main.dart';

class ConversionList extends StatefulWidget {
  @override
  _ConversionListState createState() => _ConversionListState();
}

class _ConversionListState extends State<ConversionList> {
  final textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  String From = 'AUD';
  String To = 'USD';
  String currencyRate;
  String inputAmount;

  void getData() async {
    try {
      double rate =
          await CoinData(baseCurrency: From, finalCurrency: To).getCoinData();

      currencyRate = rate.toStringAsFixed(3);
      Provider.of<Data>(context, listen: false).changeRate(currencyRate);
      print('conversion rate is');
      print(currencyRate);
    } catch (e) {
      print(e);
    }
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
                        .map(
                            (e) => (DropdownMenuItem(child: Text(e), value: e)))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        Provider.of<Data>(context, listen: false)
                            .changeInitial(value);
                        From = value;
                        getData();
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
                    borderRadius: BorderRadius.circular(30)),
                child: Center(
                  child: DropdownButton<String>(
                    value: To,
                    items: currenciesList
                        .map(
                            (e) => (DropdownMenuItem(child: Text(e), value: e)))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        Provider.of<Data>(context, listen: false)
                            .changeFinal(value);
                        To = value;
                        getData();
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
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
            ),
            controller: textController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(15),
                hintText: 'Amount',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30))),
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
                setState(() {
                  print('From: $From');
                  print('To: $To');
                  getData();

                  inputAmount = textController.text;
                  print('amount inputted is');
                  print(inputAmount);
                  Provider.of<Data>(context, listen: false)
                      .enterAmount(inputAmount);
                  Provider.of<Data>(context, listen: false)
                      .calcConvertedAmount(currencyRate);
                  Provider.of<Data>(context,listen: false).updateInitialCurDisplay(From);
                  Provider.of<Data>(context,listen: false).updateFinalCurDisplay(To);

                });
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

//lift inputAmount value and From value into CountryCard files
