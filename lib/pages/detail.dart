import 'dart:html';

import 'package:flutter/material.dart';
import 'package:projectwallet/components/line_chart.dart';
import 'package:projectwallet/components/my_app_bar.dart';
import 'package:projectwallet/shared/constants.dart';

class Detail extends StatefulWidget {
  final String coinSymbol;
  final String coinName;

  Detail({required this.coinSymbol, required this.coinName});

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  void initState() {
    super.initState();
    print("siamo nel dettaglio");
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Detail;
    print("rebuild");

    return Scaffold(
      appBar: MyAppBar(
        refreshPage: () => refresh(),
      ),
      body: Container(
        //child: Text(args.coinSymbol),
        child: LineCryptoChart(),
      ),
    );
  }

  /* Refresh page */
  void refresh() {
    print("Aggiorno");
    setState(() {});
  }
}
