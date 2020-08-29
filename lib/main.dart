
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fashion_market/helpers/authenticate.dart';
import 'package:fashion_market/helpers/helperfunction.dart';
import 'package:fashion_market/views/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool isUserLoggedIn =  false;

  @override
  void initState() {
    getLoggedInState();
    super.initState();
  }

  getLoggedInState() async {
    await HelperFunction.getUserLoggedInSharedPreference().then((value){
      setState(() {
        isUserLoggedIn =  value;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fashion Market',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primaryColor: Colors.white),
      home: isUserLoggedIn!= null ? Home() :  Authenticate(),
    );
  }
}
