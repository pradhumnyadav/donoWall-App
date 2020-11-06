import 'package:donowall/modals/HospitalList.dart';
import 'package:flutter/material.dart';

class HospitalScreen extends StatelessWidget {
  final HospitalDetails hospitalinfo;
  HospitalScreen({@required this.hospitalinfo});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.redAccent,
        title: Text(hospitalinfo.name),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        elevation: 20,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(15),
                bottomLeft: Radius.circular(15))),
      ),
      body: Container(
        color: Colors.red[100],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Padding(padding: EdgeInsets.all(0)),
                Container(
                  child: Image.network(
                    hospitalinfo.img,
                    height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 375,
                        height: 120,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.redAccent.withOpacity(0.6),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              )
                            ],
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.all(2.75),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 30,
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text("Hospital Address\n",style: TextStyle(
                                        fontSize: 17, fontStyle: FontStyle.normal)
                                        ),
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)
                                ),
                                
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  hospitalinfo.address,
                                  style: TextStyle(
                                      fontSize: 18, fontStyle: FontStyle.italic),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 375,
                        height: 100,
                        decoration: BoxDecoration(
                           boxShadow: [
                              BoxShadow(
                                color: Colors.redAccent.withOpacity(0.6),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              )
                            ],
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Blood Required in this Hospital:\n${hospitalinfo.reqBloodGrp}",
                            style: TextStyle(
                                fontSize: 18, fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Container(
                            width: 125,
                            height: 100,
                            decoration: BoxDecoration(
                               boxShadow: [
                              BoxShadow(
                                color: Colors.redAccent.withOpacity(0.6),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              )
                            ],
                                color: Colors.redAccent,
                                borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  "   Book An Appointment",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontStyle: FontStyle.italic),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Container(
                            width: 125,
                            height: 100,
                            decoration: BoxDecoration(
                               boxShadow: [
                              BoxShadow(
                                color: Colors.redAccent.withOpacity(0.6),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              )
                            ],
                                color: Colors.redAccent,
                                borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Column(
                                  children: [
                                    Icon(Icons.call,color: Colors.white,),
                                    Text(
                                      "+91-XXX-YYY-ZZZZ ",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontStyle: FontStyle.italic),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                height: 390,
                width: 400,
              ),
            )
          ],
        ),
      ),
    );
  }
}
