import 'package:direct_link/direct_link.dart';
import 'package:flutter/material.dart';

class QualityItem extends StatelessWidget {
  const QualityItem({
    required this.isSelected,
    required this.onTap,
    required this.link,
    super.key,
  });

  final bool isSelected;
  final VoidCallback onTap;
  final Link link;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: isSelected
              ? const BorderSide(color: Colors.red)
              : BorderSide.none,
        ),
      ),
      onPressed: onTap,
      child: Text(link.quality),
    );
  }
}
