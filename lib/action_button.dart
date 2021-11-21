import 'package:flutter/material.dart';
import 'package:projectwallet/models/LoginModel.dart';
import 'package:projectwallet/shared/constants.dart';
import 'package:projectwallet/home.dart';

import 'api/crypto_api.dart';

Widget actionButton(BuildContext myContext, String text) {
  return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
          onTap: () {
            CryptoApi.doLogin().then((result) {
              print('In Builder');
              Navigator.push(
                myContext,
                MaterialPageRoute(builder: (context) => Home()),
              );
            });
            print('bene');

            /* Navigator.push(
              myContext,
              MaterialPageRoute(builder: (context) => Home()),
            ); */
            print("Cliccato!");
          },
          child: Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
              boxShadow: [
                BoxShadow(
                  color: kPrimaryColor.withOpacity(0.2),
                  spreadRadius: 4,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )));
}
