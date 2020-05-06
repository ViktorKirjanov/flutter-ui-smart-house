import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_house/core/blocs/tabs/tabs_bloc.dart';
import 'package:smart_house/core/blocs/simple_bloc_delegate.dart';
import 'package:smart_house/pages/home/home_page.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(
    MultiBlocProvider(providers: [
      BlocProvider<TabsBloc>(
        create: (context) => TabsBloc(),
      ),
    ], child: App()),
  );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart House UI',
      home: HomePage(),
    );
  }
}
