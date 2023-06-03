import 'package:flutter/widgets.dart';

import 'delay_tween.dart';

class LoadingAnimation extends StatefulWidget {
  const LoadingAnimation({
    Key? key,
    this.color,
    this.size = 50.0,
    this.itemBuilder,
    this.duration = const Duration(milliseconds: 1400),
    this.controller,
  })  : assert(!(itemBuilder is IndexedWidgetBuilder && color is Color) && !(itemBuilder == null && color == null),
            'You should specify either a itemBuilder or a color'),
        super(key: key);

  final Color? color;
  final double size;
  final IndexedWidgetBuilder? itemBuilder;
  final Duration duration;
  final AnimationController? controller;

  @override
  State<LoadingAnimation> createState() => _LoadingAnimationState();
}

class _LoadingAnimationState extends State<LoadingAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = (widget.controller ?? AnimationController(vsync: this, duration: widget.duration))..repeat();
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: List.generate(5, (i) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: ScaleTransition(
              scale: DelayTween(begin: 0.5, end: 1.0, delay: i * .15).animate(_controller),
              child: SizedBox.fromSize(size: Size.square(widget.size * 0.5), child: _itemBuilder(i)),
            ),
          );
        }),
      ),
    );
  }

  Widget _itemBuilder(int index) => widget.itemBuilder != null
      ? widget.itemBuilder!(context, index)
      : DecoratedBox(
          decoration: BoxDecoration(
          color: widget.color,
          shape: BoxShape.circle,
        ));
}