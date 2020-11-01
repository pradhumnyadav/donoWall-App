import 'package:donowall/Providers/HospitalDetailsProvider.dart';
import 'package:donowall/modals/HospitalList.dart';
import 'package:donowall/modals/HospitalScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HospitalCard extends StatefulWidget {
  final HospitalDetails hospitalDetails;
  HospitalCard({this.hospitalDetails});

  @override
  _HospitalCardState createState() => _HospitalCardState();
}

class _HospitalCardState extends State<HospitalCard> {

 

  @override
  Widget build(BuildContext context) {
    // final hospitalDetailProvider=Provider.of<HospitalDetailProvider>(context);

    return GestureDetector(
      onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>HospitalScreen()));
        
      },
      child: Padding(padding: EdgeInsets.all(8),
      child: Card(
        color: Colors.red[400],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          
        ),
        elevation: 15,
        child: Container(
          height: 175,
          width: 175,
          child: Text("name" ),
                 
        ),
      ),
      ),
      
    );
  }
}