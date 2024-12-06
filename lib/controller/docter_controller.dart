import 'dart:developer';

import 'package:cc_admin_side/model/docter_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DocterController extends GetxController {
  var isLoading = false.obs;
  final FirebaseFirestore db = FirebaseFirestore.instance;
  List<Doctor> doctors = <Doctor>[].obs;

  Future<void> fetchDocterPendingRequest() async {
    try {
      isLoading.value = true;
      final QuerySnapshot querySnapshot = await db
          .collection('doctors')
          .where('isAccepted', isEqualTo: false)
          .get();
      final data = querySnapshot.docs;
      doctors.assignAll(data.map((doctor) {
        return Doctor.fromMap(doctor.data() as Map<String, dynamic>);
      }).toList());
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> varifyDocter(String id,bool status) async {
   final DocumentSnapshot  documentSnapshot = await db.collection('doctors').doc(id).get();
   if(documentSnapshot.exists){
    documentSnapshot.data().obs;
   }
  }

  
}
