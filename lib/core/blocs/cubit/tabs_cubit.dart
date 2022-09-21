import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/app_tab.dart';

class TabsCubit extends Cubit<AppTab> {
  TabsCubit() : super(AppTab.livingRoom);

  void updateTab(AppTab appTab) => emit(appTab);
}
