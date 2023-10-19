
import 'package:flutter/material.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Text('Wallet',
          style: TextStyle(color: Colors.black,
          fontSize: 20,fontWeight: FontWeight.w700),)],
        ),
      ),
    );
  }
}
