
import 'dart:convert';
import 'dart:ffi';

import 'package:http/http.dart' as http;
import 'package:stripe_payment/stripe_payment.dart';

class StripeTransactionResponse{
  String message;
  bool success;
  StripeTransactionResponse({this.message, this.success});
}

class StripeService{
  static String apiBase = "https://api.stripe.com//v1";
  static String secret = "sk_test_51HHWO9K1a8QOVxjSufpeFXQMzFzC4An86MaJVehXvqkpdY15pEoeYYJjqqw6LnWkjwS4jS9P4xaO785DHqPDAAYT00u9g7dIfZ";
  static String paymentApiUrl = '${StripeService.apiBase}/payment_intents';

  static Map<String, String> headers = {
    'Authorization' : 'Bearer ${StripeService.secret}',
    'Content-Type' : 'application/x-www-form-urlencoded'
  };

  static init(){
    StripePayment.setOptions(
        StripeOptions(
            publishableKey: "pk_test_51HHWO9K1a8QOVxjSUAgWCV4DQDroq9GFFxV2D3kupY11FeTJVwveoEYcXLIENkngxEXeUC5ZVc5z6O04jaCqGuQb00OmKRQ54b",
            merchantId: "Test",
            androidPayMode: 'test'));
  }

  static StripeTransactionResponse payViaExistingCard(String amount, String currency, card){
    return new StripeTransactionResponse(
      message: 'Transaction successfull',
      success: true
    );
  }

  static Future<StripeTransactionResponse> payWithNewCard(String amount, String currency) async{
    try{
      var paymentMethods = await StripePayment.paymentRequestWithCardForm(
          CardFormPaymentRequest()
      );

      var paymentIntent = await StripeService.createPaymentIntent(
          amount,
          currency
      );

      var respose = await StripePayment.confirmPaymentIntent(
          PaymentIntent(
            clientSecret: paymentIntent['client_secret'],
            paymentMethodId: paymentMethods.id
        )
      );

      if (respose.status == 'succeeded'){
        return new StripeTransactionResponse(
            message: 'Transaction successfull',
            success: true
        );
      } else {
        return new StripeTransactionResponse(
            message: 'Transaction fail : failed',
            success: false
        );
      }

    }
    catch (err){
      return new StripeTransactionResponse(
          message: 'Transaction fail : ${err.toString()}',
          success: false
      );
    }
  }

  static Future<Map<String, dynamic>> createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': amount,
        'currency': currency,
        'payment_method_types[]': 'card'
      };
      var response = await http.post(
          StripeService.paymentApiUrl,
          body: body,
          headers: StripeService.headers
      );
      return jsonDecode(response.body);
    } catch (err) {
      print('err charging user: ${err.toString()}');
    }
    return null;
  }

}