import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donowall/Services/FirestoreService.dart';
import 'package:donowall/modals/HospitalList.dart';
import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';

class HospitalDetailProvider with ChangeNotifier{
  final firestoreService=FirestoreService();
  String _address;
  String _name;
  String _img;
  String _reqBloodGrp;
  String _id;
  var uuid=Uuid();
  

  // GETTERS
  String get address=>_address;
  String get name=>_name;
  String get img=>_img;
  String get reqBloodGrp=>_reqBloodGrp;
  Stream<List<HospitalDetails>> get hospitalDetails=> firestoreService.getHospitalDetails();


  // Setters
  set changeName(String name){
    _name=name;
  }

  // Functions
  LoadAll(HospitalDetails hospitalDetails){
    if(hospitalDetails != null){
    _id=hospitalDetails.id;
    _address=hospitalDetails.address;
    _name=hospitalDetails.name;
    _img=hospitalDetails.img;
    _reqBloodGrp=hospitalDetails.reqBloodGrp;
    }
    else{
    _id=null;
    _address=null;
    _name=null;
    _img=null;
    _reqBloodGrp=null;
    }
  }
  SaveHospitalDetails(){
    if (_id == null){
      //Add
      var newHospitalDetails = HospitalDetails(id: uuid.v1(),address: _address,name: _name,img:_img,reqBloodGrp: _reqBloodGrp);
      print(newHospitalDetails.reqBloodGrp);
      firestoreService.setHospitalDetails(newHospitalDetails);
    } else {
      //Edit
      var updatedHospitalDetails = HospitalDetails(id: uuid.v1(),address: _address,name: _name,img:_img,reqBloodGrp: _reqBloodGrp);
      firestoreService.setHospitalDetails(updatedHospitalDetails);
    }
  }
  removeHospitalDetails(String id){
    firestoreService.DeleteHospitalDetails(id);
  }

}