import 'package:auto_route/auto_route.dart';
import 'package:feed_planner/dashboard/application/cubit/images_cubit.dart';
import 'package:feed_planner/dashboard/domain/i_images_repository.dart';
import 'package:feed_planner/dashboard/presentation/widgets/grid_item.dart';
import 'package:feed_planner/di_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;
  AnimationStatus _status = AnimationStatus.dismissed;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _animation = Tween(end: 1.0, begin: 0.0).animate(_controller)
      ..addListener(() => setState(() {}))
      ..addStatusListener((status) => _status = status);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _flipCard() {
    if (_status == AnimationStatus.dismissed) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ImagesCubit(imagesRepository: getIt<IImagesRepository>()),
      child: BlocBuilder<ImagesCubit, ImagesState>(
        builder: (context, state) => Scaffold(
          backgroundColor: const Color(0xFF121212),
          floatingActionButton: state.isLoading
              ? null
              : Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  FloatingActionButton(
                    onPressed: () => _flipCard(),
                    child: const Icon(Icons.rotate_90_degrees_ccw_rounded),
                  ),
                  FloatingActionButton(
                    onPressed: () => context.read<ImagesCubit>().pickImage(),
                    child: const Icon(Icons.add),
                  ),
                ]),
          body: Stack(children: [
            Padding(
              padding: const EdgeInsets.all(1),
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemCount: state.imageWithDominatingColor.length,
                  itemBuilder: (context, index) {
                    final entries =
                        state.imageWithDominatingColor.entries.toList();
                    final entry = entries[index];
                    return GridItem(
                        key: ValueKey(index),
                        animationValue: _animation.value,
                        dominatedColor: entry.value,
                        imagePath: entry.key.path);
                  }),
            ),
            if (state.isLoading)
              Positioned.fill(
                  child: Container(
                color: Colors.black.withOpacity(0.5),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ))
          ]),
        ),
      ),
    );
  }
}
