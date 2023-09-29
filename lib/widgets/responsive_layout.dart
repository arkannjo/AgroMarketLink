import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  // Define breakpoints
  static const double mobileMaxWidth = 800;
  static const double tabletMaxWidth = 1200;

  ResponsiveLayout({
    required this.mobile,
    this.tablet,
    this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double width = constraints.maxWidth;

        if (width > tabletMaxWidth && desktop != null) {
          return FadeTransitionLayout(child: desktop!);
        } else if (width > mobileMaxWidth && tablet != null) {
          return FadeTransitionLayout(child: tablet!);
        } else {
          return FadeTransitionLayout(child: mobile);
        }
      },
    );
  }
}

class FadeTransitionLayout extends StatefulWidget {
  final Widget child;

  FadeTransitionLayout({required this.child});

  @override
  _FadeTransitionLayoutState createState() => _FadeTransitionLayoutState();
}

class _FadeTransitionLayoutState extends State<FadeTransitionLayout> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );

    _opacityAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    // Start the animation as soon as the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) => _controller.forward());
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(opacity: _opacityAnimation, child: widget.child);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
