import 'package:flutter/material.dart';
import 'package:projectwallet/api/crypto_api.dart';
import 'package:projectwallet/components/crypto_card.dart';
import 'package:projectwallet/models/CryptoMarket.dart';
import 'package:projectwallet/shared/constants.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    /* super.initState();
    CryptoApi.fetchCoin(); */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.savings,
        ),
        title: Text('Crypto wallet'),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Icon(Icons.autorenew),
          ),
        ],
        backgroundColor: kPrimaryColor,
      ),
      body: FutureBuilder<List<CryptoMarket>>(
        future: CryptoApi.fetchCoin(),
        builder: (context, snapshot) {
          final List<CryptoMarket>? cryptoList = snapshot.data;

          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              if (snapshot.hasError) {
                return Center(child: Text('Some error occurred!'));
              } else {
                return buildCryptoGrid(cryptoList);
              }
          }
        },
      ),
    );
  }

  Widget buildCryptoGrid(List<CryptoMarket>? criptoList) => Padding(
      padding: EdgeInsets.all(8.0),
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          itemCount: 10,
          itemBuilder: (BuildContext ctx, index) {
            return cryptoCard(context, "dd");
          }));
}
