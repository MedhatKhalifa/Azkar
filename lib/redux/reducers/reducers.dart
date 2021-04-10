import 'package:azkar/models/inloading.dart';

import 'package:azkar/redux/actions/inloading_action.dart';

import 'package:azkar/redux/state/app_state.dart';

AppState appReducer(AppState state, dynamic action) {
  return AppState(
    inloading: inloadingReducer(state.inloading, action),
  );
}

InLoading inloadingReducer(InLoading inloading, dynamic action) {
  if (action is UpdateInloading) {
    return action.inloading;
  }
  return inloading;
}
