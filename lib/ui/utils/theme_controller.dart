import 'package:moufu/domain/theme_type.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_controller.g.dart';

@riverpod
class ThemeController extends _$ThemeController {
  @override
  ThemeType build() {
    load();
    return ThemeType.orange;
  }

  Future<void> set() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('theme', ThemeType.fromEnumToString(state));
  }

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    final theme = prefs.getString('theme');
    if (theme != null) {
      state = ThemeType.fromStringToEnum(theme);
    } else {
      state = ThemeType.orange;
    }
  }

  void next() {
    state = state.getNext();
  }

  void previous() {
    state = state.getPrevious();
  }
}
