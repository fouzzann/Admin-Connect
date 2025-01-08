import 'package:cc_admin_side/view/pages/approved_request_page.dart';
import 'package:cc_admin_side/view/pages/pendings_docter_request.dart';
import 'package:flutter/material.dart';


final List<(String title, IconData icon, Widget page)> pages = [
  (
    'Pending Requests',
    Icons.pending_actions_rounded,
    const PendingDoctorRequests()
  ),
  (
    'Approved Requests',
    Icons.check_circle_rounded,
    const ApprovedRequestPage()
  ),
  (
    'Logout',
    Icons.logout_rounded,
    const ApprovedRequestPage()
  ),
];