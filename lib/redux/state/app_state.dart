import 'package:azkar/models/inloading.dart';
import 'package:meta/meta.dart';

@immutable
class AppState {
  final InLoading inloading;

  AppState({
    @required this.inloading,
  });

  factory AppState.initial() {
    return AppState(
      inloading: InLoading(),
    );
  }
}
