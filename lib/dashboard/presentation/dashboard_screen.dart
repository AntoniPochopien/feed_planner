import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:feed_planner/dashboard/application/cubit/images_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ImagesCubit(),
      child: BlocBuilder<ImagesCubit, ImagesState>(
        builder: (context, state) => Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () => context.read<ImagesCubit>().pickImage(),
            child: const Icon(Icons.add),
          ),
          body: Padding(
            padding: const EdgeInsets.all(1),
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemCount: state.images.length,
                itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(1),
                    child: Image.file(
                      File(state.images[index].path),
                      fit: BoxFit.fitWidth,
                    ))),
          ),
        ),
      ),
    );
  }
}
