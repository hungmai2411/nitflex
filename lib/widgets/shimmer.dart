import 'package:flutter/material.dart';
import 'package:niflex/constants/dimensions_constants.dart';
import 'package:shimmer/shimmer.dart';

final shimmer = Shimmer(
  gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: <Color>[
        Colors.grey[900]!,
        Colors.grey[900]!,
        Colors.grey[800]!,
        Colors.grey[900]!,
        Colors.grey[900]!
      ],
      stops: const <double>[
        0.0,
        0.35,
        0.5,
        0.65,
        1.0
      ]),
  child: ListView(
    scrollDirection: Axis.horizontal,
    children: List.generate(
      6,
      (index) => Container(
        width: 110,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.red,
        ),
        margin: const EdgeInsets.only(
          left: kDefaultPadding,
        ),
      ),
    ),
  ),
);
