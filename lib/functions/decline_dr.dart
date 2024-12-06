import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

Future<void> declineDoctor(String doctorEmail) async {
  try {
    print('Declining doctor with email: $doctorEmail');

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('doctors')
        .where('email', isEqualTo: doctorEmail)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      DocumentReference doctorDoc = querySnapshot.docs.first.reference;

      await doctorDoc.update({
        'isAccepted': false,
      });

      Get.snackbar('Success', 'Doctor has been declined.');
    } else {
      Get.snackbar('Error', 'Doctor not found in Firestore.');
    }
  } catch (e) {
    print('Error declining doctor: $e');
    Get.snackbar('Error', 'There was an error declining the doctor: $e');
  }
}