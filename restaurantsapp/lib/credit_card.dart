
import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:restaurantsapp/payment_service.dart';

class CreditCard{

  Future<void> payViaNewCard(BuildContext context, double amount) async {

    FlutterMoneyFormatter fmf = new FlutterMoneyFormatter(
        amount: amount,
        settings: MoneyFormatterSettings(
            thousandSeparator: '',
            decimalSeparator: '',
        ),
    );

    ProgressDialog dialog = new ProgressDialog(context);
    dialog.style(
        message: 'Please wait...'
    );
    await dialog.show();
    var response = await StripeService.payWithNewCard(
        amount: fmf.output.nonSymbol,
        currency: 'USD'
    );
    await dialog.hide();
    Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text(response.message),
          duration: new Duration(milliseconds: response.success == true ? 1200 : 3000),
        )
    );
  }


}