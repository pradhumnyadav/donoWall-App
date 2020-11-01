import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donowall/modals/HospitalList.dart';
import 'package:firebase_core/firebase_core.dart';

class FirestoreService{
  FirebaseFirestore _db=FirebaseFirestore.instance;
  //Getting Hospital Details
  Stream<List<HospitalDetails>> getHospitalDetails(){
    return _db
    .collection("HospitalDetails")
    .snapshots()
    .map((snapshot) => snapshot.docs
    .map((doc) => HospitalDetails.fromJson(doc.data()) ).toList());
  }
  //Create or Update
  Future<void> setHospitalDetails(HospitalDetails hospitalDetails){
   var options= SetOptions(merge: true); 
    return _db
    .collection('HospitalDetails')
    .doc(hospitalDetails.id)
    .set(hospitalDetails.toMap());
  }
  //Delete
  Future<void> DeleteHospitalDetails(String id){
    return _db
    .collection("HospitalDetails")
    .doc(id)
    .delete();
  }

}