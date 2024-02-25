import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  final String? imageUrl;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;

  const CustomNetworkImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: SizedBox.expand(
        child: imageUrl == null ? const SizedBox() : _buildImage(),
      ),
    );
  }

  Widget _buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        imageUrl!,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          return child;
        },
        errorBuilder: (context, error, stackTrace) {
          return const Icon(Icons.error);
        },
      ),
    );
  }
}

class CustomCircularAvatar extends StatelessWidget {
  final String? imageUrl; // Replace with your image URL or asset path
  final double radius; // Define the radius of the circular avatar

  const CustomCircularAvatar({
    super.key,
    required this.imageUrl,
    required this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: imageUrl == null
          ? SizedBox(
              width: 2 * radius,
              height: 2 * radius,
            )
          : Image.network(
              imageUrl ?? '',
              width: 2 * radius,
              height: 2 * radius,
              fit: BoxFit.cover,
            ),
    );
  }
}
