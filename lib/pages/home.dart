import 'package:flutter/material.dart';
import 'package:projectwallet/api/crypto_api.dart';
import 'package:projectwallet/components/crypto_card.dart';
import 'package:projectwallet/components/my_app_bar.dart';
import 'package:projectwallet/main.dart';
import 'package:projectwallet/models/CryptoMarket.dart';
import 'package:projectwallet/pages/detail.dart';
import 'package:projectwallet/shared/constants.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(
          refreshPage: () => refresh(),
        ),
        body: Container(
          color: kSecondaryColor,
          child: FutureBuilder<List<CryptoMarket>>(
            future: CryptoApi.fetchCoin(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Center(child: CircularProgressIndicator());
                default:
                  if (snapshot.hasError) {
                    return Center(child: Text('Some error occurred!'));
                  } else {
                    final List<CryptoMarket> cryptoList = snapshot.data!;

                    return buildCryptoGrid(cryptoList);
                  }
              }
            },
          ),
        ));
  }

  Widget buildCryptoGrid(List<CryptoMarket> cryptoList) => Padding(
      padding: EdgeInsets.all(8.0),
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 420,
              childAspectRatio: 5.8 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          itemCount: cryptoList.length,
          itemBuilder: (BuildContext ctx, index) {
            return MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                child: cryptoCard(context, cryptoList[index]),
                onTap: () {
                  print("clicked ${cryptoList[index].symbol.toUpperCase()}");
                  navigateToDetailPage(
                      cryptoList[index].symbol, cryptoList[index].name);
                },
              ),
            );
          }));

  Future navigateToDetailPage(String symbol, String name) async {
    Navigator.pushNamed(context, '/detail',
        arguments: Detail(
          coinSymbol: symbol,
          coinName: name,
        ));
  }

/* Refresh page */
  void refresh() {
    setState(() {});
  }
}
