import 'package:moufu/domain/theme_type.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_controller.g.dart';

@riverpod
class ThemeController extends _$ThemeController {
  @override
  ThemeType build() {
    return ThemeType.orange;
  }

  void next() {
    state = state.getNext();
  }

  void previous() {
    state = state.getPrevious();
  }
}
