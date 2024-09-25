import 'package:feed_planner/di_module.dart';
import 'package:feed_planner/l10n/application/cubit/language_cubit.dart';
import 'package:feed_planner/l10n/l10n.dart';
import 'package:feed_planner/navigation/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  diInit();
  runApp(const FeedPlanner());
}

class FeedPlanner extends StatelessWidget {
  const FeedPlanner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LanguageCubit(),
      child: BlocBuilder<LanguageCubit, LanguageState>(
        builder: (context, languageState) => MaterialApp.router(
          routerConfig: getIt<AppRouter>().config(),
          title: 'Feed planner',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          locale: languageState.locale,
          supportedLocales: L10n.supported,
          localizationsDelegates: L10n.localizationDelegates,
        ),
      ),
    );
  }
}
