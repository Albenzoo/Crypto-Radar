import 'package:flutter/material.dart';
import 'package:projectwallet/models/CryptoMarket.dart';
import 'package:projectwallet/shared/constants.dart';

Widget cryptoCard(BuildContext myContext, CryptoMarket crypto) {
  return Card(
    shadowColor: kPrimaryColor,
    elevation: 8,
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.deepPurple.shade100,
              Colors.deepPurpleAccent.shade100
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          color: Colors.blue,
          //color: kPrimaryColor,
        ),
        padding: EdgeInsets.all(12),
        child: Row(children: [
          Padding(
            padding: const EdgeInsets.all(4),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade600,
                      offset: Offset(2, 2),
                      blurRadius: 10,
                      spreadRadius: 2,
                    )
                  ]),
              height: 50,
              width: 50,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Image.network(crypto.image),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 11),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(crypto.name, style: TextStyle(fontSize: 18)),
                        Text(
                            crypto.currentPrice
                                    .toString()
                                    .replaceAll(".", ",") +
                                "€",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight
                                    .bold)), /* const SizedBox(height: 8), */
                      ],
                    ),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(crypto.symbol.toUpperCase(),
                              style: TextStyle(
                                  fontSize: 18, color: Colors.grey.shade800)),
                        ])
                  ]),
            ),
          ),
        ])),
  );
}
