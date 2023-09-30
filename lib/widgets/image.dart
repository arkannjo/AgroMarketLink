import 'package:flutter/material.dart';

class CustomMaterialImage extends StatefulWidget {
  final String imagePath;
  final double? width;
  final double? height;
  final BorderRadius borderRadius;

  const CustomMaterialImage({super.key, 
    required this.imagePath,
    this.width,
    this.height,
    this.borderRadius = const BorderRadius.all(Radius.circular(8.0)),
  });

  @override
  CustomMaterialImageState createState() => CustomMaterialImageState();
}

class CustomMaterialImageState extends State<CustomMaterialImage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _controller,
      child: Material(
        elevation: 5.0,
        borderRadius: widget.borderRadius,
        child: ClipRRect(
          borderRadius: widget.borderRadius,
          child: InkWell(
            onTap: () {
              // Adicione uma ação ao tocar, se desejar.
            },
            child: Image.asset(
              widget.imagePath,
              width: widget.width,
              height: widget.height,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
