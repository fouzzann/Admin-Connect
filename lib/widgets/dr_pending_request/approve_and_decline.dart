import 'package:flutter/material.dart';

class ApproveAndDecline extends StatelessWidget {
  final VoidCallback? onApprove;
  final VoidCallback? onDecline;
  final bool isLoading;

  const ApproveAndDecline({
    super.key,
    this.onApprove,
    this.onDecline,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildButton(
            context: context,
            label: 'Approve',
            color: Colors.green.withOpacity(0.2),
            onPressed: onApprove,
          ),
          const SizedBox(width: 16),
          _buildButton(
            context: context,
            label: 'Decline',
            color: Colors.blue.withOpacity(0.2),
            onPressed: onDecline,
          ),
        ],
      ),
    );
  }

  Widget _buildButton({
    required BuildContext context,
    required String label,
    required Color color,
    required VoidCallback? onPressed,
  }) {
    final textTheme = Theme.of(context).textTheme;

    return SizedBox(
      width: 120, // Fixed width
      height: 48, // Fixed height
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: isLoading ? null : onPressed,
          child: Ink(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [color, color.withOpacity(0.8)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: color.withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Center(
              child: isLoading
                ? SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 3,
                    ),
                  )
                : Text(
                    label,
                    style: textTheme.labelLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}