import 'package:feed_planner/dashboard/application/cubit/images_cubit.dart';
import 'package:feed_planner/dashboard/domain/image_with_dominating_color.dart';
import 'package:feed_planner/dashboard/presentation/widgets/grid_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reorderable_grid_view/reorderable_grid_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Grid extends StatefulWidget {
  final AnimationController controller;
  final List<ImageWithDominatingColor> imagesWithDominatingColor;
  const Grid(
      {super.key,
      required this.controller,
      required this.imagesWithDominatingColor});

  @override
  State<Grid> createState() => _GridState();
}

class _GridState extends State<Grid> {
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    _animation = Tween(end: 1.0, begin: 0.0).animate(widget.controller)
      ..addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return ReorderableGridView.builder(
        onReorder: context.read<ImagesCubit>().updateOrder,
        onDragStart: (dragIndex) => HapticFeedback.lightImpact(),
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemCount: widget.imagesWithDominatingColor.length,
        itemBuilder: (context, index) => GridItem(
              key: ValueKey(widget.imagesWithDominatingColor[index].hashCode),
              animationValue: _animation.value,
              imageWithDominatingColor: widget.imagesWithDominatingColor[index],
            ));
  }
}
