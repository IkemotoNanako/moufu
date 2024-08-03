import 'package:moufu/domain/theme_type.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_controller.g.dart';

@riverpod
class ThemeController extends _$ThemeController {
  @override
  FutureOr<ThemeType> build() async {
    final prefs = await SharedPreferences.getInstance();
    final theme = prefs.getString('theme');
    return theme != null ? ThemeType.fromStringToEnum(theme) : ThemeType.orange;
  }

  Future<void> set() async {
    final prefs = await SharedPreferences.getInstance();
    state.when(
        data: (data) async {
          await prefs.setString('theme', ThemeType.fromEnumToString(data));
        },
        error: (_, __) {},
        loading: () {});
  }

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    final theme = prefs.getString('theme');
    if (theme != null) {
      state = await AsyncValue.guard(() async {
        return ThemeType.fromStringToEnum(theme);
      });
    } else {
      state = await AsyncValue.guard(() async {
        return ThemeType.orange;
      });
    }
  }

  Future<void> next() async {
    state = await AsyncValue.guard(() async {
      return state.value!.getNext();
    });
  }

  Future<void> previous() async {
    state = await AsyncValue.guard(() async {
      return state.value!.getPrevious();
    });
  }
}
