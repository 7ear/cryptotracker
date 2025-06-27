import 'package:cryptotracker/models/crypto_coin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'crypto_coin_screen.dart';
import '../api/api.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key, required this.title});

  final String title;

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  List<CryptoCoin>? cryptoCoinList;

  @override
  void initState() {
    super.initState();
    _loadCryptoData();
  }

  Future<void> _loadCryptoData() async {
    final coins = await GetCryptoCoins().getCoinsList();
    setState(() {
      cryptoCoinList = coins;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: _buildBody(theme),
    );
  }

  Widget _buildBody(ThemeData theme) {
    if (cryptoCoinList == null) {
      return const Center(child: CircularProgressIndicator());
    } else if (cryptoCoinList!.isEmpty) {
      return const Center(child: Text('Нет данных'));
    } else {
      return ListView.separated(
        separatorBuilder: (context, i) => const Divider(),
        itemCount: cryptoCoinList!.length,
        itemBuilder: (context, i) => ListTile(
          leading: SvgPicture.asset(('images/${cryptoCoinList![i].name}_logo.svg'), height: 40, width: 40),
          title: Text(cryptoCoinList![i].name, style: theme.textTheme.bodyMedium),
          subtitle: Text('${cryptoCoinList![i].priceInUSD} USD', style: theme.textTheme.bodySmall),
          trailing: const Icon(Icons.arrow_forward_ios, color: Color(0xFFC5C5C5)),
          onTap: () {
            Navigator.pushNamed(context, '/coin', arguments: CoinDetailArguments(cryptoCoinList![i].name));
          },
        ),
      );
    }
  }
}
