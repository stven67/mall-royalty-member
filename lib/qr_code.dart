import 'package:flutter/material.dart';

class QRCodePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Color.fromRGBO(132, 110, 69, 1.0)),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/homebg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(240, 239, 234, 1.0),
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: EdgeInsets.all(20),
                child: Image.asset(
                  'images/qr_code.png',
                  width: 200,
                  height: 200,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Checkout dan dapatkan poin loyalty eksklusif! 🛍️✨',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}