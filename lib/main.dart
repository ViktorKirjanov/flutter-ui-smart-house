import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_house/pages/home_page/home_page.dart';

import 'core/blocs/bloc_observer.dart';
import 'core/blocs/cubit/tabs_cubit.dart';

void main() async {
  Bloc.observer = AppBlocObserver();

  runApp(
    MultiBlocProvider(providers: [
      BlocProvider<TabsCubit>(
        create: (context) => TabsCubit(),
      ),
    ], child: const App()),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart House UI',
      home: HomePage(),
    );
  }
}
