import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 2
      appBar: AppBar(
        actions: [
        ],
        title: Text('Payment', textAlign: TextAlign.center,),

      ),
      body: Container(
        alignment: Alignment.center,
        child: Text('Payment Complete!', style: TextStyle(fontSize: 30),)
      ),
    );



  }
}
