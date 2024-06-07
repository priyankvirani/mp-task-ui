import 'dart:async';
import 'package:flutter/material.dart';

class ShowLeftToRight extends StatefulWidget {
  final Widget child;
  final int delay;

  ShowLeftToRight({required this.child, required this.delay});

  @override
  _ShowLeftToRightState createState() => _ShowLeftToRightState();
}

class _ShowLeftToRightState extends State<ShowLeftToRight>
    with TickerProviderStateMixin {
  late AnimationController _animController;
  late Animation<Offset> _animOffset;

  @override
  void initState() {
    super.initState();

    _animController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
    final curve =
        CurvedAnimation(curve: Curves.ease, parent: _animController);
    _animOffset = Tween<Offset>(begin: const Offset(0.0, 0.0), end: const Offset(0.1, 0.0))
        .animate(curve);

    Timer(Duration(milliseconds: widget.delay), () {
      _animController.forward();
    });
    }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animController,
      child: SlideTransition(
        position: _animOffset,
        child: widget.child,
      ),
    );
  }
}
