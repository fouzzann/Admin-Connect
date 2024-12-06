import 'package:cc_admin_side/controller/docter_controller.dart';
import 'package:cc_admin_side/widgets/dr_pending_request/accept_and_decline.dart';
import 'package:cc_admin_side/widgets/dr_pending_request/doctor_image.dart';
import 'package:cc_admin_side/widgets/dr_pending_request/dr_certificate_image.dart';
import 'package:cc_admin_side/widgets/dr_pending_request/dr_name_gender_and_age.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorDetailsPage extends StatefulWidget {
  const DoctorDetailsPage({super.key});

  @override
  State<DoctorDetailsPage> createState() => _DoctorDetailsPageState();
}

class _DoctorDetailsPageState extends State<DoctorDetailsPage> {
  final doctorController = Get.put(DocterController());

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: doctorController.doctors.length,
      itemBuilder: (context, index) {
        final doctor = doctorController.doctors[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Material(
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) => Dialog(
                                  child: Container(
                                      padding: const EdgeInsets.all(12),
                                      child: DoctorImage(
                                          image: doctor.image,
                                          fullName: doctor.fullName)),
                                ),
                              );
                            },
                            child: DoctorImage(
                                image: doctor.image,
                                fullName: doctor.fullName)),
                        const SizedBox(width: 16),
                        Expanded(
                            child: DrNameGenderAndAge(
                          fullName: doctor.fullName,
                          age: doctor.age,
                          gender: doctor.gender,
                          category: doctor.category,
                        )),
                      ],
                    ),
                    const SizedBox(height: 16),
                    _buildInfoRow(
                        Icons.local_hospital_outlined, doctor.hospitalName),
                    _buildInfoRow(Icons.mail_outline, doctor.email),
                    _buildInfoRow(
                      Icons.calendar_today_outlined,
                      'Available: ${doctor.availableDays.join(", ")}',
                    ),
                    _buildInfoRow(
                      Icons.work_outline,
                      '${doctor.yearsOfExperience} years experience',
                    ),
                    _buildInfoRow(
                      Icons.payments_outlined,
                      'Consultation fee: ${doctor.consultationFee}',
                    ),
                     _buildInfoRow(
                      Icons.location_on_outlined,
                      'Location: ${doctor.location}',
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Medical Certificate',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    DrCertificateImage(
                        certificateImage: doctor.certificateImage),
                    const SizedBox(height: 16),
                    AcceptAndDecline()
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

Widget _buildInfoRow(IconData icon, String text) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey[600]),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 14,
            ),
          ),
        ),
      ],
    ),
  );
}
