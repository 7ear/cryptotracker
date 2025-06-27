import 'package:flutter/material.dart';

class CoinDetailArguments {
  final String coinId;
  CoinDetailArguments(this.coinId);
}

class CryptoCoinScreen extends StatelessWidget {
  const CryptoCoinScreen({super.key, required this.title, required this.coinId});

  final String coinId;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(coinId)));
  }
}
