import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email;
  String _password;
  Future<void> _createUser() async{
    try {
      UserCredential userCredential=await FirebaseAuth.instance
      .createUserWithEmailAndPassword(email: _email, password: _password);
    }on FirebaseAuthException catch(e){
      print("error: $e");
    }catch(e){
      print("error: $e");
    }
  }
  Future<void> _login() async{
    try {
      UserCredential userCredential=await FirebaseAuth.instance
      .signInWithEmailAndPassword(email: _email, password: _password);
    }on FirebaseAuthException catch(e){
      print("error: $e");
    }catch(e){
      print("error: $e");
    }
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DonoWall"),
        centerTitle:true,
        backgroundColor: Colors.redAccent,
        elevation: 20,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(15),
                bottomLeft: Radius.circular(15))),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: InputDecoration(
                hintText: "Enter Your Mail Id here",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                )),
                onChanged: (value){
                  _email=value;
                },
          ),
          Padding(padding: EdgeInsets.all(5)),
          TextField(
            decoration: InputDecoration(
                hintText: "Enter Your Password here",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                )),
                onChanged: (value){
                  _password=value;
                },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                onPressed: _createUser,
                child: Text("Sign Up"),
                color: Colors.redAccent,
              ),
              Padding(padding: EdgeInsets.all(5)),
              RaisedButton(
                onPressed: _login,
                child: Text("Login"),
                color: Colors.redAccent,
              ),
            ],
          )
        ],
      ),
    );
  }
}
