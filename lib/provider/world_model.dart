import 'package:flutter/material.dart';

class WorldModel {
  final String confirmed;
  final String recovered;
  final String deaths;

  WorldModel({
    @required this.confirmed,
    @required this.recovered,
    @required this.deaths
  });
}