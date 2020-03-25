import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:tracking_corona/provider/world_model.dart';

import 'indonesia_model.dart';
import 'world_model.dart';

class CoronaProvider with ChangeNotifier {
  IndonesiaModel summary;
  WorldModel world;
  String updated;

//FUNGSI INI AKAN MENJALANKAN API CALL UNTUK MENGAMBIL DATA
  Future<void> getData() async {
    //BAGIAN PERTAMA ADALAH UNTUK MENGAMBIL DATA DARI INDONESIA
    final url = 'https://kawalcovid19.harippe.id/api/summary';
    final response = await http.get(url); //HIT KE API 
    //DAN CONVERT DATA YANG DITERIMA
    final result = json.decode(response.body) as Map<String, dynamic>;
    //LALU MASUKKAN KE DALAM STATE SUMMARY DENGAN FORMAT BERDASARKAN INDONESIAMODEL
    summary = IndonesiaModel(
      confirmed: result['confirmed']['value'],
      recovered: result['recovered']['value'],
      deaths: result['deaths']['value'],
      activeCare: result['activeCare']['value'],
    );
    //SIMPAN DATA PEMBAHARUAN KE DALAM STATE UPDATED
    updated = result['metadata']['lastUpdatedAt'];

    //ADAPUN DATA DUNIA MEMILIKI 3 BUAH API, DAN MASING-MASING MENGHASILKAN DATANYA SENDIRI.
    //ADAPUN PENJELASANNYA SAMA DENGAN PENJELASAN SEBELUMNYA
    final worldPositive = 'https://api.kawalcorona.com/positif/';
    final responsePositive = await http.get(worldPositive);
    final resultPositive = json.decode(responsePositive.body);

    final worldRecovered = 'https://api.kawalcorona.com/sembuh/';
    final responseRecovered = await http.get(worldRecovered);
    final resultRecovered = json.decode(responseRecovered.body);

    final worldDeaths = 'https://api.kawalcorona.com/meninggal/';
    final responseDeaths = await http.get(worldDeaths);
    final resultDeaths = json.decode(responseDeaths.body);

    world = WorldModel(
      confirmed: resultPositive['value'],
      deaths: resultRecovered['value'],
      recovered: resultDeaths['value'],
    );
    notifyListeners(); //INFORMASIKAN BAHWA TERJADI PERUBAHAN STATE AGAR WIDGET DIRENDER ULANG
  }
}
