import 'package:cc_admin_side/widgets/dr_pending_request/dr_certificate_image_null_case.dart';
import 'package:flutter/material.dart';

class DrCertificateImage extends StatelessWidget {
  final String certificateImage;

  const DrCertificateImage({required this.certificateImage}) : super();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => Dialog(
              child: Container(
                padding: const EdgeInsets.all(12),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    certificateImage,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return Center(
                        child: Text(
                          'Error loading image',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                        ),
                      );
                    },
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.blue),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          );
        },
        child: DrCertificateImageNullCase(certificateImage: certificateImage));
  }
}
