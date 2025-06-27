import 'widgets/crypto_coin_screen.dart';
import 'widgets/crypto_list_screen.dart';
import 'package:flutter/material.dart';
import 'theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto Tracker',
      theme: theme,
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (context) => CryptoListScreen(title: 'Crypto Tracker'));
          case '/coin':
            final args = settings.arguments as CoinDetailArguments;
            return MaterialPageRoute(builder: (context) => CryptoCoinScreen(title: '', coinId: args.coinId));
          default:
            return MaterialPageRoute(
              builder: (context) => const Scaffold(body: Center(child: Text('Страница не найдена'))),
            );
        }
      },
    );
  }
}
