import 'package:flutter/material.dart';
import 'package:projectwallet/models/CryptoMarket.dart';
import 'package:projectwallet/shared/constants.dart';
import 'package:projectwallet/home.dart';

Widget cryptoCard(BuildContext myContext, CryptoMarket crypto) {
  return Card(
      child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(crypto.name, style: TextStyle(fontSize: 24)),
      const SizedBox(height: 12),
      Text("altre info",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
    ],
  ));
}
