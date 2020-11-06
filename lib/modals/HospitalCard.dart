import 'package:donowall/modals/HospitalList.dart';
import 'package:donowall/modals/HospitalScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HospitalCard extends StatelessWidget {
 
  
  final HospitalDetails hospitalinfo;
  HospitalCard({@required this.hospitalinfo});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HospitalScreen(hospitalinfo: hospitalinfo,)));
      },
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Card(
          
          color: Colors.red[100],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 15,
          child: Column(
            children: [
               Padding(padding: EdgeInsets.all(2)),
              Container(
                width: 100,
                height: 22,
                decoration: BoxDecoration(
                   boxShadow: [
                              BoxShadow(
                                color: Colors.redAccent.withOpacity(0.4),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              )
                            ],
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(5)
                ),
                child: Center(
                  child: Text(hospitalinfo.name,style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                fontStyle: FontStyle.normal),),
                ),
              ),
              Padding(padding: EdgeInsets.all(5)),
              Hero(
                tag: hospitalinfo.name,
                child:  Image.network(hospitalinfo.img,
                height: MediaQuery.of(context).size.height * 0.16,
              width: MediaQuery.of(context).size.width,)
                  
              ),

            ],
          ),
        ),
      ),
    );
  }
}
