import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CurveBottomNavigationBar extends StatefulWidget {
  const CurveBottomNavigationBar({
    Key? key,
    this.color = Colors.white,
    this.elevation = 0,
    this.shape,
    this.clipBehavior = Clip.none,
    this.notchMargin = 4.0,
    this.child,
  })  : assert(elevation == null || elevation >= 0.0),
        assert(notchMargin != null),
        assert(clipBehavior != null),
        super(key: key);

  final Widget? child;
  final Color? color;
  final double? elevation;
  final NotchedShape? shape;
  final Clip? clipBehavior;
  final double? notchMargin;

  @override
  State createState() => _CurveBottomNavigationBarState();
}

class _CurveBottomNavigationBarState extends State<CurveBottomNavigationBar> {
  ValueListenable<ScaffoldGeometry>? geometryListenable;
  // static const double _defaultElevation = 8.0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    geometryListenable = Scaffold.geometryOf(context);
  }

  @override
  Widget build(BuildContext context) {
    final BottomAppBarTheme babTheme = BottomAppBarTheme.of(context);
    final NotchedShape? notchedShape = widget.shape ?? babTheme.shape;
    final CustomClipper<Path> clipper = notchedShape != null
        ? _CurveBottomNavigationBarClipper(
            geometry: geometryListenable,
            shape: notchedShape,
            notchMargin: widget.notchMargin,
          )
        : const ShapeBorderClipper(shape: RoundedRectangleBorder());
    // final double elevation =
    //     widget.elevation ?? babTheme.elevation ?? _defaultElevation;
    // final Color color =
    //     widget.color ?? babTheme.color ?? Theme.of(context).bottomAppBarColor;
    // final Color effectiveColor =
    //     ElevationOverlay.applyOverlay(context, color, elevation);
    return ClipPath(
      clipper: clipper,
      child: Container(
        height: 70,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        child: Material(
          type: MaterialType.transparency,
          child: widget.child == null ? null : SafeArea(child: widget.child!),
        ),
      ),
    );
  }
}

class _CurveBottomNavigationBarClipper extends CustomClipper<Path> {
  const _CurveBottomNavigationBarClipper({
    required this.geometry,
    required this.shape,
    required this.notchMargin,
  })  : assert(geometry != null),
        assert(shape != null),
        assert(notchMargin != null),
        super(reclip: geometry);

  final ValueListenable<ScaffoldGeometry>? geometry;
  final NotchedShape? shape;
  final double? notchMargin;

  @override
  Path getClip(Size size) {
    final Rect? button = geometry!.value.floatingActionButtonArea?.translate(
      0.0,
      geometry!.value.bottomNavigationBarTop! * -1.0,
    );
    return shape!
        .getOuterPath(Offset.zero & size, button!.inflate(notchMargin!));
  }

  @override
  bool shouldReclip(_CurveBottomNavigationBarClipper oldClipper) {
    return oldClipper.geometry != geometry ||
        oldClipper.shape != shape ||
        oldClipper.notchMargin != notchMargin;
  }
}
