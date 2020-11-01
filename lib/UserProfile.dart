import 'package:donowall/LoginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DonoWall"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        elevation: 20,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(15),
                bottomLeft: Radius.circular(15))),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
           Row(
              mainAxisAlignment:MainAxisAlignment.center ,
              children: [
                CircleAvatar(
                  maxRadius: 100,
                  backgroundImage: AssetImage('images/user.png') ,

                ),
              ],
            ),
            Column(
              children: [
                Text("Dummy Name"),
                Text("Adress of user:Dummy "),
                 Text("31 yrs"),
                  Text("B+"),
                  MaterialButton(onPressed: () async{
                   await FirebaseAuth.instance.signOut();
                   
                  },
                  child: Text("Sign Out"),
                  )
              ],
            ),
         
          
        ],
      ),
    );
  }
}
