import 'package:firebase_auth/firebase_auth.dart';
import 'package:fashion_market/model/user.dart';

class AuthMethods {
  final FirebaseAuth auth = FirebaseAuth.instance;


  Future signInWithEmailAndPassword(String email, String password) async {

    try{
      UserCredential result = await auth.signInWithEmailAndPassword(email: email, password: password);

      return result.user!=null ? UserInfomation(userID: result.user.uid) : null;
    }catch(e){
      print(e);
    }
  }

  Future signUpWithEmailAndPassword(String email, String password) async {
    try{
      UserCredential result = await auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return user!=null ? UserInfomation(userID: user.uid) : null;
    }catch(e){
      print(e);
    }
  }

  Future resetPassword(String email) async{
    try{
      return await auth.sendPasswordResetEmail(email: email);
    }catch(e){
      print(e);
    }
  }


  Future signOut() async {
    try{
      return await auth.signOut();
    }catch(e){
      print(e);
    }
  }
}