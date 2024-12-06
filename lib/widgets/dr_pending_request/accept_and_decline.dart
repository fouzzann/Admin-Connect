import 'package:cc_admin_side/functions/decline_dr.dart';
import 'package:flutter/material.dart';
import 'package:cc_admin_side/functions/accept_dr.dart';

class AcceptAndDecline extends StatelessWidget {
  final String doctorEmail;

  const AcceptAndDecline({super.key, required this.doctorEmail});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () async {
              await approveDoctor(doctorEmail);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green[600],
            ),
            child: const Text(
              'Approve',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: ElevatedButton(
            onPressed: () async {
              await declineDoctor(doctorEmail);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red[600],
            ),
            child: const Text(
              'Decline',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
