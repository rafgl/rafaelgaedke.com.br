import 'package:flutter/material.dart';

class AnimatedCounter extends StatefulWidget {
  final int endValue;
  final String suffix;
  final String prefix;
  final TextStyle? textStyle;
  final Duration duration;

  const AnimatedCounter({
    Key? key,
    required this.endValue,
    this.suffix = '',
    this.prefix = '',
    this.textStyle,
    this.duration = const Duration(seconds: 2),
  }) : super(key: key);

  @override
  State<AnimatedCounter> createState() => _AnimatedCounterState();
}

class _AnimatedCounterState extends State<AnimatedCounter> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  int _currentValue = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    _animation = Tween<double>(
      begin: 0,
      end: widget.endValue.toDouble(),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ))
      ..addListener(() {
        setState(() {
          _currentValue = _animation.value.toInt();
        });
      });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '${widget.prefix}$_currentValue${widget.suffix}',
      style: widget.textStyle,
    );
  }
}
