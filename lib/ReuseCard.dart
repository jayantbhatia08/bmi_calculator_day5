
import 'package:flutter/material.dart';

class ReuseAbleCard extends StatelessWidget {

  ReuseAbleCard({required this.colour, required this.cardChild});
  final Color colour;
  final Widget cardChild;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin:const EdgeInsets.all(10.0),
      // padding: const EdgeInsets.all(10),
      decoration:BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: colour,
      ),
    );
  }
}