import 'package:auto_route/auto_route.dart';
import 'package:feed_planner/dashboard/application/cubit/images_cubit.dart';
import 'package:feed_planner/dashboard/domain/i_images_repository.dart';
import 'package:feed_planner/dashboard/presentation/widgets/grid.dart';
import 'package:feed_planner/di_module.dart';
import 'package:feed_planner/local_storage/domain/i_local_storage_repository.dart';
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
  bool animationState = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _flipCard() {
    if (!animationState) {
      animationState = true;
      _controller.forward();
    } else {
      animationState = false;
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ImagesCubit(
        imagesRepository: getIt<IImagesRepository>(),
        localStorageRepository: getIt<ILocalStorageRepository>(),
      ),
      child: BlocBuilder<ImagesCubit, ImagesState>(
        builder: (context, state) => Scaffold(
            backgroundColor: const Color(0xFF121212),
            floatingActionButton:
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              FloatingActionButton(
                onPressed: () => _flipCard(),
                child: const Icon(Icons.rotate_90_degrees_ccw_rounded),
              ),
              FloatingActionButton(
                onPressed: () => context.read<ImagesCubit>().pickImage(),
                child: const Icon(Icons.add),
              ),
            ]),
            body: Grid(
              controller: _controller,
              imagesWithDominatingColor: state.imagesWithDominatingColor,
            )),
      ),
    );
  }
}
