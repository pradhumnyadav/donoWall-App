import 'package:donowall/HomePage.dart';
import 'package:donowall/LoginPage.dart';
import 'package:donowall/Providers/HospitalDetailsProvider.dart';
import 'package:donowall/UserProfile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(debugShowCheckedModeBanner: false,
      
    //   home: LoginPage(),
    //   home: HomePage(),
    // );
    return FutureBuilder(
      future: _initialization,
      builder:(context,snapshot){
        if(snapshot.hasError){
          return MaterialApp(
            home:  Scaffold(
            body: Center(
              child: Text("Error:${snapshot.error}"),
            )
          ),
          );
        }
        if(snapshot.connectionState==ConnectionState.done){
          return StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot){
              if(snapshot.connectionState==ConnectionState.active){
                User user=snapshot.data;
              if(user==null){
                return MaterialApp(
                  home: LoginPage(),
                );

              }
              else{
                  return ChangeNotifierProvider(
                    create: (context)=>HospitalDetailProvider(),
                                      child: MaterialApp(
                    home: HomePage(),
                ),
                  );


              }
              return Scaffold(
          body: Center(
            child: Text("Checking Authentication...."),
          ),
        ); }
             

            },
          );
        }
        return MaterialApp(
          home: Scaffold(
          body: Center(
            child: Text("Connecting to the app...."),
          ),
        )
        );
      } ,
      
    );
  }
}

