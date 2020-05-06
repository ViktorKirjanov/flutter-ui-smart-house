part of 'tabs_bloc.dart';

abstract class TabsEvent extends Equatable {
  const TabsEvent();
}

class UpdateTab extends TabsEvent {
  final AppTab tab;

  const UpdateTab(this.tab);

  @override
  List<Object> get props => [tab];

  @override
  String toString() => 'UpdateTab { tab: $tab }';
}
