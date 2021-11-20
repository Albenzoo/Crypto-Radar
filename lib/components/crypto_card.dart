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
                        Padding(
                            padding: const EdgeInsets.only(right: 6),
                            child: Text(
                                crypto.currentPrice
                                        .toString()
                                        .replaceAll(".", ",") +
                                    "€",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold))),
                      ],
                    ),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(crypto.symbol.toUpperCase(),
                              style: TextStyle(
                                  fontSize: 18, color: Colors.grey.shade800)),
                          createPercentageChip(crypto.priceChangePercentage24h),
                        ])
                  ]),
            ),
          ),
        ])),
  );
}

/* create the Chip based on the given percentage */
Chip createPercentageChip(double? crypto24percentage) {
  if (crypto24percentage == null) {
    return Chip(label: Text("NaN"), backgroundColor: Colors.grey);
  }
  String cryptoMovement = getCryptoMovement(crypto24percentage);
  String percentageLabel =
      "${getPriceChangePercentage24Label(crypto24percentage)}%";
  switch (cryptoMovement) {
    case "positive":
      return Chip(
        label: Text(percentageLabel),
        backgroundColor: chipColorPositive,
        avatar: CircleAvatar(
          backgroundColor: chipColorPositive,
          child: Icon(
            Icons.add_circle,
            color: Colors.green,
            size: 20.0,
          ),
        ),
      );
    case "negative":
      return Chip(
        label: Text(percentageLabel),
        backgroundColor: chipColorNegative,
        avatar: CircleAvatar(
          backgroundColor: chipColorNegative,
          child: Icon(
            Icons.remove_circle,
            color: Colors.red,
            size: 20.0,
          ),
        ),
      );
    default:
      return Chip(
        label: Text("0%"),
        backgroundColor: chipColorNeutral,
        avatar: CircleAvatar(
          backgroundColor: chipColorNeutral,
          child: Icon(
            Icons.drag_handle,
            color: Colors.grey.shade800,
            size: 20.0,
          ),
        ),
      );
  }
}

/* Return the value without the minus and cutted*/
String getPriceChangePercentage24Label(double crypto24percentage) {
  return crypto24percentage > 0
      ? crypto24percentage.toStringAsFixed(2)
      : crypto24percentage.toStringAsFixed(2).substring(1);
}

/* Return the string trend of the crypto */
String getCryptoMovement(double crypto24percentage) {
  if (crypto24percentage == 0) {
    return "neutral";
  } else if (crypto24percentage > 0) {
    return "positive";
  } else {
    return "negative";
  }
}
