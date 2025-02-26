import 'package:custom_fab_menu/src/expandable_children.dart';
import 'package:custom_fab_menu/src/fab_child.dart';
import 'package:custom_fab_menu/src/models/child_item.dart';
import 'package:flutter/material.dart';

class FABWidget extends StatefulWidget {
  const FABWidget({super.key, required this.menuChildren});

  final List<ChildItem> menuChildren;

  @override
  State<FABWidget> createState() => _FABWidgetState();
}

class _FABWidgetState extends State<FABWidget>
    with SingleTickerProviderStateMixin {
  bool _expanded = false;
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      value: _expanded ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<Widget> _expandedFab() {
    return widget.menuChildren.map((ChildItem currentChild) {
      return ExpandableChildren(
        animationController: _controller,
        index: widget.menuChildren.indexOf(currentChild),
        currentChild: FABChild(menuItem: currentChild),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const CircleBorder(),
      backgroundColor: Theme.of(context).primaryColor,
      splashColor: Colors.transparent,
      onPressed: () {
        showDialog(
            barrierColor: Colors.black.withOpacity(0.6),
            barrierDismissible: true,
            context: context,
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.only(right: 16, bottom: 16),
                child: Stack(
                  alignment: Alignment.bottomRight,
                  clipBehavior: Clip.none,
                  children: [
                    FloatingActionButton(
                      shape: const CircleBorder(),
                      backgroundColor: Color(0xff94B4F6),
                      splashColor: Colors.transparent,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.menu, color: Colors.white),
                    ),
                    ..._expandedFab()
                  ],
                ),
              );
            }).then((value) {
          setState(() {
            _expanded = !_expanded;
            if (_expanded) {
              _controller.forward();
            } else {
              _controller.reverse();
            }
          });
        });
        setState(() {
          _expanded = !_expanded;
          if (_expanded) {
            _controller.forward();
          } else {
            _controller.reverse();
          }
        });
      },
      child: const Icon(Icons.menu, color: Colors.white),
    );
  }
}
