

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_market/services/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fashion_market/widgets/widgets.dart';
import 'package:fashion_market/helpers/sizes_helpers.dart';
import 'package:fashion_market/services/auth.dart';
import 'package:fashion_market/views/home.dart';
import 'package:fashion_market/helpers/helperfunction.dart';
class SignIn extends StatefulWidget {
  final Function toggle;

  SignIn(this.toggle);
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {


  bool isLoading =  false;

  final formKey = GlobalKey<FormState>();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  AuthMethods authMethods = new AuthMethods();
  DatabaseMethods databaseMethods =  new DatabaseMethods();
  QuerySnapshot snapshotUserInfo;


  onClickSignIn(){
    if(formKey.currentState.validate()){

      setState(() {
        isLoading = true;
      });

      databaseMethods.getUserByUserEmail(email.text.trim()).then((val){
        snapshotUserInfo = val;
        HelperFunction.saveUserEmailSharedPreference(snapshotUserInfo.documents[0].get("email"));
        HelperFunction.saveUserNameSharedPreference(snapshotUserInfo.documents[0].get("name"));
      });

      authMethods.signInWithEmailAndPassword(email.text.trim(), password.text.trim()).then((value) {
        //print("${value.uid}");
        print(value);
        if(value != null){

          HelperFunction.saveUserLoggedInSharedPreference(true);
          Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) => Home()
          ));
        }

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: appBarSignIn(context),
      body: isLoading ? Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ) : SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: displayHeight(context)-50,
          alignment: Alignment.bottomCenter,
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      validator: (val){
                        return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val) ? null : "Please provide email";
                      },
                      controller: email,
                      style: simpleTextFieldStyle(),
                      decoration: textFieldInputDecoration("Email"),
                    ),
                    TextFormField(
                      obscureText: true,
                      validator: (val){
                        return val.length>=6?null:"Please provide password with more 5 characters";
                      },
                      controller: password,
                      style: simpleTextFieldStyle(),
                      decoration: textFieldInputDecoration("Password"),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 8,),
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text("Forgot Password?", style: simpleTextFieldStyle(),),
              ),
              SizedBox(height: 8,),
              GestureDetector(
                onTap: (){
                  onClickSignIn();
                },
                child: Container(
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
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,

                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      widget.toggle();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        "Register now",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          decoration: TextDecoration.underline
                        ),
                      ),
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
