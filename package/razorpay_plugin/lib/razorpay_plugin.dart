library razorpay_plugin;

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class MyRazorpayPlugin {
  static void openRazorPay({
    required String keyId,
    required int amount,
    required String name,
    required String description,
    required String email,
    required int contact,
  }) async {
    Razorpay razorpay = Razorpay();
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);

    Map<String, dynamic> options = {
      'key': keyId,
      'amount': amount,
      'name': name,
      'description': description,
      'prefill': {'contact': contact, 'email': email}
    };

    try {
      razorpay.open(options);
    } catch (e) {
      log(e.toString());
    }
  }

  static void handlePaymentSuccess(
      PaymentSuccessResponse response, BuildContext context) {
    log('${response.paymentId},${response.orderId},${response.signature}');
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Success"),
      ),
    );
  }

  static void handlePaymentError(
      PaymentFailureResponse response, BuildContext context) {
    // _channel.invokeMethod('paymentError', response);
    log('${response.message},${response.error},${response.code}');
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Failed"),
      ),
    );
  }

  static void handleExternalWallet(
      ExternalWalletResponse response, BuildContext context) {
    log('${response.walletName},');
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("External Wallet"),
      ),
    );
  }
}
