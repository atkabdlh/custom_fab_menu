import 'package:flutter/material.dart';

class ExpandableChildren extends StatefulWidget {
  const ExpandableChildren({
    super.key,
    required this.animationController,
    required this.index,
    required this.currentChild,
  });

  final AnimationController animationController;
  final int index;
  final Widget currentChild;

  @override
  State<ExpandableChildren> createState() => _ExpandableChildrenState();
}

class _ExpandableChildrenState extends State<ExpandableChildren> {
  @override
  Widget build(BuildContext context) {
    CurvedAnimation animation = CurvedAnimation(
      curve: Curves.fastOutSlowIn,
      reverseCurve: Curves.easeOutQuad,
      parent: widget.animationController,
    );
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Positioned(
          right: 0,
          bottom: 72 + widget.index * 72,
          child: child!,
        );
      },
      child: FadeTransition(
        opacity: animation,
        child: widget.currentChild,
      ),
    );
  }
}
