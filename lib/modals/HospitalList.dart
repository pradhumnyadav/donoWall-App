import 'package:flutter/material.dart';
// For DATABASE
class HospitalDetails{
  String id;
  String address;
  String name;
  String img;
  String reqBloodGrp;

  HospitalDetails({this.address,@required this.id,this.reqBloodGrp, this.name,this.img});

  factory HospitalDetails.fromJson(Map<String,dynamic>json){
       return HospitalDetails( 
        id: json['id'],
        address :json['address'],
        name :json['name'] ,
        img : json['img'],
        reqBloodGrp:json["reqBloodGrp"]
        );
  }
  Map<String,dynamic> toMap(){
    return{
      'id':id,
      'address':address,
      'img':img,
      'name':name,
      'reqBloodGrp':reqBloodGrp
  };

  }
  }
