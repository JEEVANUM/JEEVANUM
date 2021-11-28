import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
final Widget cardChild;
ReusableCard({@required this.cardChild});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11),
      child: Container(

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)
        ),
        child: cardChild

      ),
    );
  }
}
