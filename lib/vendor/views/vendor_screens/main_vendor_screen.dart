import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../model/vendor_model.dart';

class MainVendorScreen extends StatelessWidget {

  MainVendorScreen({super.key});

  CollectionReference _vendorsStream = FirebaseFirestore.instance.collection(
      'vendors');
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: _vendorsStream.doc(_auth.currentUser!.uid).snapshots(),
      builder: (BuildContext context,
          AsyncSnapshot<DocumentSnapshot> snapshot) {
        if(snapshot.hasError){
          return Text("Paso algo malo");
        }
        if(snapshot.connectionState == ConnectionState.waiting){
          return Text("Loading");
        }
        VendorModel vendorModel = VendorModel.fromJson(
            snapshot.data!.data() as Map<String, dynamic>
        );
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(vendorModel.image,
                        width: 90,
                        fit: BoxFit.cover),
                  ),
                  Text("Aprobado", style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50),),
                  SizedBox(height: 10,),
                  TextButton(onPressed: () {
                    _auth.signOut();
                  },
                      child: Text('fuera', style: TextStyle(fontSize: 20),)
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
