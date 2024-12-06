import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

Future<void> approveDoctor(String doctorEmail) async {
  try {
    print('Approving doctor with email: $doctorEmail');

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('doctors')
        .where('email', isEqualTo: doctorEmail)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      DocumentReference doctorDoc = querySnapshot.docs.first.reference;

      await doctorDoc.update({
        'isAccepted': true,
      });

      Get.snackbar('Success', 'Doctor has been approved.');
    } else {
      Get.snackbar('Error', 'Doctor not found in Firestore.');
    }
  } catch (e) {
    print('Error approving doctor: $e');
    Get.snackbar('Error', 'There was an error approving the doctor: $e');
  }
}
