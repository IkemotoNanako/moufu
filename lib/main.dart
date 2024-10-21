import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health/health.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:moufu/domain/theme_type.dart';
import 'package:moufu/ui/page/graph/graph_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:moufu/ui/utils/theme_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await dotenv.load(fileName: 'dotenv');

  MobileAds.instance.initialize();

  Health().configure();

  final prefs = await SharedPreferences.getInstance();
  final theme = prefs.getString('theme');

  runApp(
    ProviderScope(
      child: MyApp(
        themeType:
            ThemeType.fromStringToEnum(theme ?? ThemeType.orange.toString()),
      ),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key, required this.themeType});

  final ThemeType themeType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeControllerProvider);
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: ThemeType.fromEnumToColor(
              theme.hasValue ? theme.value ?? themeType : themeType),
        ),
        useMaterial3: true,
      ),
      home: theme.isLoading
          ? const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : const GraphPage(),
    );
  }
}
