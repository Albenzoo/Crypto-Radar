import 'dart:html';

import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  final String coinSymbol;

  Detail({required this.coinSymbol});

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

    return Container(
      child: Text(args.coinSymbol),
    );
  }
}
