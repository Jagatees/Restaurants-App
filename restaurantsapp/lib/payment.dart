import 'package:flutter/material.dart';
import 'existing_cards.dart';
import 'new_card.dart';

// https://dashboard.stripe.com/test/dashboard -> to see money and transtions

// This is the Payment Page to Chose other options
class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => NewCard('15000'),
        '/existing-cards': (context) => ExistingCardsPage('20000')
      },
    );
  }
}
