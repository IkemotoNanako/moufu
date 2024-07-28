import 'package:flutter/material.dart';

enum ThemeType {
  orange,
  red,
  redAccent,
  purple,
  blueAccent,
  blue,
  lightBlue,
  lightBlueAccent,
  cyan,
  cyanAccent,
  greenAccent,
  green,
  lightGreenAccent,
  lightGreen,
  indigo,
  indigoAccent,
  grey,
  brown,
  black,
  amber,
  amberAccent,
  blueGrey,
  deepOrange,
  deepOrangeAccent,
  deepPurple,
  deepPurpleAccent,
  lime,
  limeAccent,
  pink,
  pinkAccent,
  teal,
  tealAccent,
  ;

  static String fromString(String themeType) {
    switch (themeType) {
      case 'ThemeType.orange':
        return 'オレンジ';
      case 'ThemeType.red':
        return 'レッド';
      case 'ThemeType.redAccent':
        return 'レッドアクセント';
      case 'ThemeType.purple':
        return 'パープル';
      case 'ThemeType.blueAccent':
        return 'ブルーアクセント';
      case 'ThemeType.blue':
        return 'ブルー';
      case 'ThemeType.lightBlue':
        return 'ライトブルー';
      case 'ThemeType.lightBlueAccent':
        return 'ライトブルーアクセント';
      case 'ThemeType.cyan':
        return 'シアン';
      case 'ThemeType.cyanAccent':
        return 'シアンアクセント';
      case 'ThemeType.greenAccent':
        return 'グレーンアクセント';
      case 'ThemeType.green':
        return 'グリーン';
      case 'ThemeType.lightGreenAccent':
        return 'ライトグリーンアクセント';
      case 'ThemeType.lightGreen':
        return 'ライトグリーン';
      case 'ThemeType.indigo':
        return 'インディゴ';
      case 'ThemeType.indigoAccent':
        return 'インディゴアクセント';
      case 'ThemeType.grey':
        return 'グレー';
      case 'ThemeType.brown':
        return 'ブラウン';
      case 'ThemeType.black':
        return 'ブラック';
      case 'ThemeType.amber':
        return 'アンバー';
      case 'ThemeType.amberAccent':
        return 'アンバーアクセント';
      case 'ThemeType.blueGrey':
        return 'ブルーグレー';
      case 'ThemeType.deepOrange':
        return 'ディープオレンジ';
      case 'ThemeType.deepOrangeAccent':
        return 'ディープオレンジアクセント';
      case 'ThemeType.deepPurple':
        return 'ディープパープル';
      case 'ThemeType.deepPurpleAccent':
        return 'ディープパープルアクセント';
      case 'ThemeType.lime':
        return 'ライム';
      case 'ThemeType.limeAccent':
        return 'ライムアクセント';
      case 'ThemeType.pink':
        return 'ピンク';
      case 'ThemeType.pinkAccent':
        return 'ピンクアクセント';
      case 'ThemeType.teal':
        return 'ティール';
      case 'ThemeType.tealAccent':
        return 'ティールアクセント';
      default:
        throw ArgumentError('無効なテーマタイプです');
    }
  }

  static String fromEnumToString(ThemeType themeType) {
    switch (themeType) {
      case ThemeType.orange:
        return 'オレンジ';
      case ThemeType.red:
        return 'レッド';
      case ThemeType.redAccent:
        return 'レッドアクセント';
      case ThemeType.purple:
        return 'パープル';
      case ThemeType.blueAccent:
        return 'ブルーアクセント';
      case ThemeType.blue:
        return 'ブルー';
      case ThemeType.lightBlue:
        return 'ライトブルー';
      case ThemeType.lightBlueAccent:
        return 'ライトブルーアクセント';
      case ThemeType.cyan:
        return 'シアン';
      case ThemeType.cyanAccent:
        return 'シアンアクセント';
      case ThemeType.greenAccent:
        return 'グレーンアクセント';
      case ThemeType.green:
        return 'グリーン';
      case ThemeType.lightGreenAccent:
        return 'ライトグリーンアクセント';
      case ThemeType.lightGreen:
        return 'ライトグリーン';
      case ThemeType.indigo:
        return 'インディゴ';
      case ThemeType.indigoAccent:
        return 'インディゴアクセント';
      case ThemeType.grey:
        return 'グレー';
      case ThemeType.brown:
        return 'ブラウン';
      case ThemeType.black:
        return 'ブラック';
      case ThemeType.amber:
        return 'アンバー';
      case ThemeType.amberAccent:
        return 'アンバーアクセント';
      case ThemeType.blueGrey:
        return 'ブルーグレー';
      case ThemeType.deepOrange:
        return 'ディープオレンジ';
      case ThemeType.deepOrangeAccent:
        return 'ディープオレンジアクセント';
      case ThemeType.deepPurple:
        return 'ディープパープル';
      case ThemeType.deepPurpleAccent:
        return 'ディープパープルアクセント';
      case ThemeType.lime:
        return 'ライム';
      case ThemeType.limeAccent:
        return 'ライムアクセント';
      case ThemeType.pink:
        return 'ピンク';
      case ThemeType.pinkAccent:
        return 'ピンクアクセント';
      case ThemeType.teal:
        return 'ティール';
      case ThemeType.tealAccent:
        return 'ティールアクセント';
    }
  }

  ThemeType getNext() {
    switch (this) {
      case ThemeType.orange:
        return ThemeType.red;
      case ThemeType.red:
        return ThemeType.redAccent;
      case ThemeType.redAccent:
        return ThemeType.purple;
      case ThemeType.purple:
        return ThemeType.blueAccent;
      case ThemeType.blueAccent:
        return ThemeType.blue;
      case ThemeType.blue:
        return ThemeType.lightBlue;
      case ThemeType.lightBlue:
        return ThemeType.lightBlueAccent;
      case ThemeType.lightBlueAccent:
        return ThemeType.cyan;
      case ThemeType.cyan:
        return ThemeType.cyanAccent;
      case ThemeType.cyanAccent:
        return ThemeType.greenAccent;
      case ThemeType.greenAccent:
        return ThemeType.green;
      case ThemeType.green:
        return ThemeType.lightGreenAccent;
      case ThemeType.lightGreenAccent:
        return ThemeType.lightGreen;
      case ThemeType.lightGreen:
        return ThemeType.indigo;
      case ThemeType.indigo:
        return ThemeType.indigoAccent;
      case ThemeType.indigoAccent:
        return ThemeType.grey;
      case ThemeType.grey:
        return ThemeType.brown;
      case ThemeType.brown:
        return ThemeType.black;
      case ThemeType.black:
        return ThemeType.amber;
      case ThemeType.amber:
        return ThemeType.amberAccent;
      case ThemeType.amberAccent:
        return ThemeType.blueGrey;
      case ThemeType.blueGrey:
        return ThemeType.deepOrange;
      case ThemeType.deepOrange:
        return ThemeType.deepOrangeAccent;
      case ThemeType.deepOrangeAccent:
        return ThemeType.deepPurple;
      case ThemeType.deepPurple:
        return ThemeType.deepPurpleAccent;
      case ThemeType.deepPurpleAccent:
        return ThemeType.lime;
      case ThemeType.lime:
        return ThemeType.limeAccent;
      case ThemeType.limeAccent:
        return ThemeType.pink;
      case ThemeType.pink:
        return ThemeType.pinkAccent;
      case ThemeType.pinkAccent:
        return ThemeType.teal;
      case ThemeType.teal:
        return ThemeType.tealAccent;
      case ThemeType.tealAccent:
        return ThemeType.orange;
    }
  }

  ThemeType getPrevious() {
    switch (this) {
      case ThemeType.orange:
        return ThemeType.tealAccent;
      case ThemeType.red:
        return ThemeType.orange;
      case ThemeType.redAccent:
        return ThemeType.red;
      case ThemeType.purple:
        return ThemeType.redAccent;
      case ThemeType.blueAccent:
        return ThemeType.purple;
      case ThemeType.blue:
        return ThemeType.blueAccent;
      case ThemeType.lightBlue:
        return ThemeType.blue;
      case ThemeType.lightBlueAccent:
        return ThemeType.lightBlue;
      case ThemeType.cyan:
        return ThemeType.lightBlueAccent;
      case ThemeType.cyanAccent:
        return ThemeType.cyan;
      case ThemeType.greenAccent:
        return ThemeType.cyanAccent;
      case ThemeType.green:
        return ThemeType.greenAccent;
      case ThemeType.lightGreenAccent:
        return ThemeType.green;
      case ThemeType.lightGreen:
        return ThemeType.lightGreenAccent;
      case ThemeType.indigo:
        return ThemeType.lightGreen;
      case ThemeType.indigoAccent:
        return ThemeType.indigo;
      case ThemeType.grey:
        return ThemeType.indigoAccent;
      case ThemeType.brown:
        return ThemeType.grey;
      case ThemeType.black:
        return ThemeType.brown;
      case ThemeType.amber:
        return ThemeType.black;
      case ThemeType.amberAccent:
        return ThemeType.amber;
      case ThemeType.blueGrey:
        return ThemeType.amberAccent;
      case ThemeType.deepOrange:
        return ThemeType.blueGrey;
      case ThemeType.deepOrangeAccent:
        return ThemeType.deepOrange;
      case ThemeType.deepPurple:
        return ThemeType.deepOrangeAccent;
      case ThemeType.deepPurpleAccent:
        return ThemeType.deepPurple;
      case ThemeType.lime:
        return ThemeType.deepPurpleAccent;
      case ThemeType.limeAccent:
        return ThemeType.lime;
      case ThemeType.pink:
        return ThemeType.limeAccent;
      case ThemeType.pinkAccent:
        return ThemeType.pink;
      case ThemeType.teal:
        return ThemeType.pinkAccent;
      case ThemeType.tealAccent:
        return ThemeType.teal;
    }
  }

  static Color fromEnumToColor(ThemeType themeType) {
    switch (themeType) {
      case ThemeType.orange:
        return Colors.orange;
      case ThemeType.red:
        return Colors.red;
      case ThemeType.redAccent:
        return Colors.redAccent;
      case ThemeType.purple:
        return Colors.purple;
      case ThemeType.blueAccent:
        return Colors.blueAccent;
      case ThemeType.blue:
        return Colors.blue;
      case ThemeType.lightBlue:
        return Colors.lightBlue;
      case ThemeType.lightBlueAccent:
        return Colors.lightBlueAccent;
      case ThemeType.cyan:
        return Colors.cyan;
      case ThemeType.cyanAccent:
        return Colors.cyanAccent;
      case ThemeType.greenAccent:
        return Colors.greenAccent;
      case ThemeType.green:
        return Colors.green;
      case ThemeType.lightGreenAccent:
        return Colors.lightGreenAccent;
      case ThemeType.lightGreen:
        return Colors.lightGreen;
      case ThemeType.indigo:
        return Colors.indigo;
      case ThemeType.indigoAccent:
        return Colors.indigoAccent;
      case ThemeType.grey:
        return Colors.grey;
      case ThemeType.brown:
        return Colors.brown;
      case ThemeType.black:
        return Colors.black;
      case ThemeType.amber:
        return Colors.amber;
      case ThemeType.amberAccent:
        return Colors.amberAccent;
      case ThemeType.blueGrey:
        return Colors.blueGrey;
      case ThemeType.deepOrange:
        return Colors.deepOrange;
      case ThemeType.deepOrangeAccent:
        return Colors.deepOrangeAccent;
      case ThemeType.deepPurple:
        return Colors.deepPurple;
      case ThemeType.deepPurpleAccent:
        return Colors.deepPurpleAccent;
      case ThemeType.lime:
        return Colors.lime;
      case ThemeType.limeAccent:
        return Colors.limeAccent;
      case ThemeType.pink:
        return Colors.pink;
      case ThemeType.pinkAccent:
        return Colors.pinkAccent;
      case ThemeType.teal:
        return Colors.teal;
      case ThemeType.tealAccent:
        return Colors.tealAccent;
    }
  }
}
