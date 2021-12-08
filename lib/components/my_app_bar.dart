import 'package:flutter/material.dart';
import 'package:projectwallet/shared/constants.dart';

class MyAppBar extends StatefulWidget with PreferredSizeWidget {
  final Function refreshPage;
  MyAppBar({Key? key, required this.refreshPage}) : super(key: key);
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  _MyAppBarState createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      leading: Icon(
        Icons.radar,
      ),
      title: Text('Crypto Radar'),
      actions: [
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: IconButton(
              icon: new Icon(Icons.autorenew),
              onPressed: () {
                print("Refresh");
                widget.refreshPage();
              },
            )),
      ],
      backgroundColor: kPrimaryColor,
    );
  }
}
