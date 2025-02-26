import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageHandler extends StatelessWidget {
  const ImageHandler({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    if (imageUrl.isEmpty) {
      return const Icon(
        Icons.person,
        size: 50,
      );
    } else if (imageUrl.split('.').last.contains('svg')) {
      if (imageUrl.startsWith('http')) {
        return SvgPicture.network(
          imageUrl,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        );
      } else {
        return SvgPicture.asset(
          imageUrl,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        );
      }
    } else {
      if (imageUrl.startsWith('http')) {
        return Image.network(
          imageUrl,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        );
      } else {
        return Image.asset(
          imageUrl,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        );
      }
    }
  }
}
