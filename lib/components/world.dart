import 'package:flutter/material.dart';
import 'package:tracking_corona/widgets/summary_card.dart';

class World extends StatelessWidget {
  final height;
  final data;

  World({this.height, this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 5),
          child: const Text(
            'LAPORAN KASUS DUNIA',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          flex: 1,
          child: GridView.count(
            crossAxisCount: 3,
            childAspectRatio: height / 430,
            children: <Widget>[
              SummaryCard(
                total: data.world.confirmed,
                label: 'Positif',
                color: Colors.yellow[100],
                size: 20,
              ),
              SummaryCard(
                total: data.world.recovered,
                label: 'Sembuh',
                color: Colors.greenAccent[100],
                size: 20,
              ),
              SummaryCard(
                total: data.world.deaths,
                label: 'Meninggal',
                color: Colors.red[800],
                size: 20,
              ),
            ],
          ),
        ),
        Text('Pembaruan Terakhir'),
        Text(data.updated),
      ],
    );
  }
}
