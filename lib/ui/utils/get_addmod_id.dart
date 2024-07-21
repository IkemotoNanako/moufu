// import 'dart:io';

// import 'package:flutter/foundation.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';

// String getAdBannerUnitId() {
//   final String androidId = dotenv.env['ANDROID_ADMOB_ID'] ?? '';
//   final String iosId = dotenv.env['IOS_ADMOB_ID'] ?? '';

//   String bannerUnitId = "";
//   if (Platform.isAndroid) {
//     // Android のとき
//     bannerUnitId = kDebugMode
//         ? "ca-app-pub-3940256099942544/6300978111" // Androidのデモ用バナー広告ID
//         : androidId;
//   } else if (Platform.isIOS) {
//     // iOSのとき
//     bannerUnitId = kDebugMode
//         ? "ca-app-pub-3940256099942544/2934735716" // iOSのデモ用バナー広告ID
//         : iosId;
//   }
//   return bannerUnitId;
// }
