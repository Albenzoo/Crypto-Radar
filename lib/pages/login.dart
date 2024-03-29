import 'package:flutter/material.dart';
import 'package:projectwallet/components/action_button.dart';
import 'package:projectwallet/shared/constants.dart';
import 'package:projectwallet/shared/loading/loading_provider.dart';
import 'package:provider/provider.dart';
import '../api/crypto_api.dart';

class LogIn extends StatefulWidget {
  LogIn({Key? key}) : super(key: key);
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.all(size.height > 770
          ? 64
          : size.height > 670
              ? 32
              : 16),
      child: Center(
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
          ),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            height: size.height *
                (size.height > 770
                    ? 0.7
                    : size.height > 670
                        ? 0.8
                        : 0.9),
            width: 500,
            color: Colors.white,
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "LOG IN",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[700],
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        width: 30,
                        child: Divider(
                          color: kPrimaryColor,
                          thickness: 2,
                        ),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Email',
                          labelText: 'Email',
                          suffixIcon: Icon(
                            Icons.mail_outline,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      TextField(
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          labelText: 'Password',
                          suffixIcon: Icon(
                            Icons.lock_outline,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 64,
                      ),
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                            child: actionButton(context, "Log In"),
                            onTap: () async {
                              print("loggin in...");
                              //show loading;
                              context.read<LoadingProvider>().setLoad(true);
                              final response = await CryptoApi.doLogin();
                              if (response.status != "OK") {
                                throw Exception("error");
                              } else {
                                navigateToSubPage();
                                //hide loading;
                                context.read<LoadingProvider>().setLoad(false);
                              }
                            }),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future navigateToSubPage() async {
    Navigator.pushNamed(context, '/home');
  }
}
