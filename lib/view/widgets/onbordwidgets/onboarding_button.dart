
import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatefulWidget {
  final VoidCallback onTap;
  final String text;
  final double? width;
  final double? height;
  final double? borderRadius;
  final double? fontSize;
  final Color? color;
  const CustomOutlinedButton({
    required this.onTap,
    required this.text,
    this.height,
    this.width,
    this.borderRadius,
    this.fontSize,
    this.color,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomOutlinedButton> createState() => _CustomOutlinedButtonState();
}

class _CustomOutlinedButtonState extends State<CustomOutlinedButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final Duration _animationDuration = const Duration(milliseconds: 300);
  final Tween<double> _tween = Tween<double>(begin: 1.0, end: 0.95);
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: _animationDuration,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _controller.forward().then((_) {
          _controller.reverse();
        });
        widget.onTap();
      },
      child: ScaleTransition(
        scale: _tween.animate(
          CurvedAnimation(
            parent: _controller,
            curve: Curves.easeOut,
            reverseCurve: Curves.easeIn,
          ),
        ),
        child: Card(
          elevation: 0,
          color:  Color.fromARGB(255, 0, 148, 149),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            height: widget.height ?? 44,
            alignment: Alignment.center,
            width:  MediaQuery.of(context).size.width*0.6,
            decoration: BoxDecoration(
              border: Border.all(color: widget.color ??  Color.fromARGB(255, 0, 148, 149),),
              borderRadius: BorderRadius.circular(
                widget.borderRadius ?? 20,
              ),
            ),
            child: Text(
              widget.text,
              style: TextStyle(
                  color: widget.color ?? Colors.white,
                  fontSize: widget.fontSize ?? 18,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}
