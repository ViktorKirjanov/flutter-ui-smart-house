import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:smart_house/core/models/app_tab.dart';

part 'tabs_event.dart';

class TabsBloc extends Bloc<TabsEvent, AppTab> {
  @override
  AppTab get initialState => AppTab.LivingRoom;

  @override
  Stream<AppTab> mapEventToState(
    TabsEvent event,
  ) async* {
    if (event is UpdateTab) {
      yield event.tab;
    }
  }
}
