import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projectwallet/constants.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        textTheme: GoogleFonts.secularOneTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
       body: Container(
         width: size.width,
         height: size.height,
         child: Stack(
           children: [
             Row(
               children: [
                 Container(
                   height: double.infinity,
                   width: size.width / 2,
                   color: kPrimaryColor,
                 ),
                 Container(
                   height: double.infinity,
                   width: size.width / 2,
                   color: Colors.white,
                 )
               ],
             ),

             Align(
               alignment: Alignment.topLeft,
               child: Padding(
                 padding: EdgeInsets.all(32),
                 child: Text(
                   "Welcome",
                   style: TextStyle(
                     color: Colors.white,
                     fontSize: 24,
                     fontWeight: FontWeight.bold,
                   ),
                 ),
                 ),
             )
           ],
         ),
       ),
    );
  }
}