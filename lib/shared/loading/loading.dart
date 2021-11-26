import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:projectwallet/shared/constants.dart';
import 'package:provider/provider.dart';
import 'loading_provider.dart';

class LoadingScreen {
  static TransitionBuilder init({
    TransitionBuilder? builder,
  }) {
    return (BuildContext context, Widget? child) {
      if (builder != null) {
        return builder(context, LoadingCustom(child: child!));
      } else {
        return LoadingCustom(child: child!);
      }
    };
  }
}

class LoadingCustom extends StatelessWidget {
  final Widget child;
  const LoadingCustom({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ChangeNotifierProvider<LoadingProvider>(
            create: (context) => LoadingProvider(),
            builder: (context, _) {
              return Stack(children: [
                child,
                Consumer<LoadingProvider>(builder: (context, provider, child) {
                  return provider.loading ? LoadingWidget() : Container();
                })
              ]);
            }));
  }
}

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kSecondaryColor,
      child: Center(
        child: SpinKitFoldingCube(color: kPrimaryColor, size: 120.0),
      ),
    );
  }
}
