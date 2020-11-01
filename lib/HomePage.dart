import 'package:donowall/Providers/HospitalDetailsProvider.dart';
import 'package:donowall/Services/FirestoreService.dart';
import 'package:donowall/UserProfile.dart';
import 'package:donowall/modals/HospitalCard.dart';
import 'package:donowall/modals/HospitalList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List hospitalist=Provider.of<List<HospitalDetails>>(context);
  final FirestoreService firestoreService=FirestoreService();
  @override
  Widget build(BuildContext context) {
    final hospitaldetailProvider = Provider.of<HospitalDetailProvider>(context);
    return Scaffold(
        drawer: Drawer(
          elevation: 15,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                child: Text(
                  "Welcome",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(10)),
                ),
              ),
              ListTile(
                title: Text("Function 1"),
                onTap: null,
              ),
              ListTile(
                title: Text("Function 2"),
                onTap: null,
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text("DonoWall"),
          centerTitle: true,
          backgroundColor: Colors.redAccent,
          elevation: 20,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15))),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => UserProfile()));
                },
                child: Icon(
                  Icons.account_circle,
                  size: 35,
                ),
              ),
            )
          ],
        ),
        backgroundColor: Colors.red[100],
        body: StreamBuilder<List<HospitalDetails>>(
       stream:hospitaldetailProvider.hospitalDetails ,

          builder: (context, snapshot) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return HospitalCard(
                    hospitalDetails: snapshot.data[index],
                  );
                });
          },
        )
        // body: StreamProvider(create: (BuildContext context)=> firestoreService.getHospitalDetails(),
        // child: ListView.builder(
        //   itemCount: ,
        // ),
        // )
        
        );
  }
}
