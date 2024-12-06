import 'package:flutter/material.dart';

class DrCertificateImageNullCase extends StatelessWidget {
  final String certificateImage;
  const DrCertificateImageNullCase({Key? key, required this.certificateImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(
          certificateImage,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Center(
              child: Text(
                'Image not available',
                style: TextStyle(color: Colors.grey[600]),
              ),
            );
          },
        ),
      ),
    );
  }
}
