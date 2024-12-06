import 'package:flutter/material.dart';

class AcceptAndDecline extends StatelessWidget {
  const AcceptAndDecline({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
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
            onPressed: () {},
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
