import 'package:flutter/material.dart';
import 'package:projectwallet/shared/constants.dart';
import 'package:projectwallet/home.dart';

Widget cryptoCard(BuildContext myContext, String text) {
  return Card(
      child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("Nome della crypto", style: TextStyle(fontSize: 24)),
      const SizedBox(height: 12),
      Text("altre info",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
    ],
  ));
}
