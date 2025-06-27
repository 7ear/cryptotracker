import 'package:dio/dio.dart';
import '../models/crypto_coin.dart';

class GetCryptoCoins{
  Future<List<CryptoCoin>> getCoinsList() async {
    final response = await Dio().get('https://min-api.cryptocompare.com/data/pricemulti?fsyms=BTC,ETH,SOL,TON,TRON,LTC,BNB,SUI,GRASS&tsyms=USD,RUB');
    final data = response.data as Map<String, dynamic>;
    final dataList = data.entries.map((el) => CryptoCoin(
      name: el.key, 
      priceInUSD: (el.value as Map<String, dynamic>)['USD'],
      priceInRUB: (el.value as Map<String, dynamic>)['RUB'],
    )).toList();

    return dataList;
  }
}
