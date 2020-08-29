import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fashion_market/widgets/widgets.dart';
import 'package:fashion_market/helpers/sizes_helpers.dart';
class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarSignIn(context),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: displayHeight(context)-50,
          alignment: Alignment.bottomCenter,
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                style: simpleTextFieldStyle(),
                decoration: textFieldInputDecoration("Email"),
              ),
              TextField(
                style: simpleTextFieldStyle(),
                decoration: textFieldInputDecoration("Password"),
              ),
              SizedBox(height: 8,),
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text("Forgot Password?", style: simpleTextFieldStyle(),),
              ),
              SizedBox(height: 8,),
              Container(
                alignment: Alignment.center,
                width: displayWidth(context),
                padding: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xff007EF4),
                      const Color(0xff2A75BC),
                    ]
                  ),
                  borderRadius: BorderRadius.circular(30)
                ),
                child: Text("Sign In", style: mediumTextStyle(),),
              ),
              SizedBox(height: 16,),
              Container(
                alignment: Alignment.center,
                width: displayWidth(context),
                padding: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          const Color(0xff007EF4),
                          const Color(0xff2A75BC),
                        ]
                    ),
                    borderRadius: BorderRadius.circular(30)
                ),
                child: Text("Sign In with Google", style: mediumTextStyle()
                ,),
              ),
              SizedBox(height: 16,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Don't have account?",
                    style: mediumTextStyle(),
                  ),
                  Text(
                    "Register now",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      decoration: TextDecoration.underline
                    ),
                  )
                ],
              ),
              SizedBox(height: 50,)
            ],
          ),
        ),
      ),
    );
  }
}
