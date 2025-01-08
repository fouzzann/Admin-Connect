import 'package:cc_admin_side/controller/docter_controller.dart';
import 'package:cc_admin_side/widgets/dr_pending_request/doctor_details_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApprovedRequestPage extends StatefulWidget {
  const ApprovedRequestPage({super.key});

  @override
  State<ApprovedRequestPage> createState() => _ApprovedRequestPageState();
}

class _ApprovedRequestPageState extends State<ApprovedRequestPage> {
  final doctorController = Get.put(DocterController());

  @override
  void initState() {
    super.initState();
    Future.delayed(
        Duration.zero, () => doctorController.fetchDocterAcceptedRequest());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          'Approved Doctor',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
      ),
      body: Obx(() {
        if (doctorController.doctors.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.nature_people_outlined,
                    size: 64, color: Colors.grey[400]),
                const SizedBox(height: 16),
                Text(
                  'No approved applications',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          );
        }

        return DoctorDetailsPage();
      }),
    );
  }
}
