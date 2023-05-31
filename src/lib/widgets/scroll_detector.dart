import 'package:flutter/material.dart';

/// リストなどの無限スクロールする際のスクロール量を計算するクラス
class ScrollDetector extends StatefulWidget {
  const ScrollDetector({
    super.key,
    required this.builder,
    required this.loadNext,
    required this.threshold,
  });

  final Widget Function(BuildContext, ScrollController) builder;
  final void Function(ScrollController) loadNext;
  final double threshold;

  @override
  State<StatefulWidget> createState() => _ScrollDetectorState();
}

class _ScrollDetectorState extends State<ScrollDetector> {
  final _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final scrollValue =
          _controller.offset / _controller.position.maxScrollExtent;
      if (scrollValue > widget.threshold) {
        widget.loadNext(_controller);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
