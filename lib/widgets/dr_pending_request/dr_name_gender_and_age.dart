import 'package:flutter/material.dart';

class DrNameGenderAndAge extends StatelessWidget {
  final String fullName;
  final String age;
  final String gender;
  final String category;
  
  const DrNameGenderAndAge({
    Key? key,
    required this.fullName,
    required this.age,
    required this.gender,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          fullName,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          '${age} years old • ${gender}',
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 4,
          ),
          decoration: BoxDecoration(
            color: Colors.blue[50],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            category,
            style: TextStyle(
              color: Colors.blue[700],
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
