import 'dart:html';

import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  final String coinSymbol;

  Detail({Key? key, required this.coinSymbol}) : super(key: key);

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
    return Container(
      child: Text('s'),
    );
  }
}
