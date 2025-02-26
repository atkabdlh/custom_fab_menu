import 'package:custom_fab_menu/src/image_handler.dart';
import 'package:custom_fab_menu/src/models/child_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FABChild extends StatefulWidget {
  const FABChild({super.key, required this.menuItem});

  final ChildItem menuItem;

  @override
  State<FABChild> createState() => _FABChildState();
}

class _FABChildState extends State<FABChild> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            widget.menuItem.title,
            style: GoogleFonts.barlow(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
        Material(
          shape: const CircleBorder(),
          clipBehavior: Clip.antiAlias,
          color: Theme.of(context).primaryColor,
          elevation: 4,
          child: Container(
            width: 56,
            height: 56,
            child: InkWell(
              onTap: () async {},
              child: Padding(
                padding: EdgeInsets.all(16),
                child: ImageHandler(imageUrl: widget.menuItem.imageUrl),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
