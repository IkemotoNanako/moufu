import 'package:flutter/material.dart';

enum ThemeType {
  orange,
  red,
  purple,
  blue,
  lightBlue,
  cyan,
  green,
  lightGreen,
  indigo,
  grey,
  brown,
  black,
  amber,
  blueGrey,
  deepOrange,
  deepPurple,
  lime,
  pink,
  teal,
  ;

  static ThemeType fromStringToEnum(String themeType) {
    switch (themeType) {
      case 'オレンジ':
        return ThemeType.orange;
      case 'レッド':
        return ThemeType.red;
      case 'パープル':
        return ThemeType.purple;
      case 'ブルー':
        return ThemeType.blue;
      case 'ライトブルー':
        return ThemeType.lightBlue;
      case 'シアン':
        return ThemeType.cyan;
      case 'グリーン':
        return ThemeType.green;
      case 'ライトグリーン':
        return ThemeType.lightGreen;
      case 'インディゴ':
        return ThemeType.indigo;
      case 'グレー':
        return ThemeType.grey;
      case 'ブラウン':
        return ThemeType.brown;
      case 'ブラック':
        return ThemeType.black;
      case 'アンバー':
        return ThemeType.amber;
      case 'ブルーグレー':
        return ThemeType.blueGrey;
      case 'ディープオレンジ':
        return ThemeType.deepOrange;
      case 'ディープパープル':
        return ThemeType.deepPurple;
      case 'ライム':
        return ThemeType.lime;
      case 'ピンク':
        return ThemeType.pink;
      case 'ティール':
        return ThemeType.teal;
    }
    return ThemeType.orange;
  }

  static String fromEnumToString(ThemeType themeType) {
    switch (themeType) {
      case ThemeType.orange:
        return 'オレンジ';
      case ThemeType.red:
        return 'レッド';
      case ThemeType.purple:
        return 'パープル';
      case ThemeType.blue:
        return 'ブルー';
      case ThemeType.lightBlue:
        return 'ライトブルー';
      case ThemeType.cyan:
        return 'シアン';
      case ThemeType.green:
        return 'グリーン';
      case ThemeType.lightGreen:
        return 'ライトグリーン';
      case ThemeType.indigo:
        return 'インディゴ';
      case ThemeType.grey:
        return 'グレー';
      case ThemeType.brown:
        return 'ブラウン';
      case ThemeType.black:
        return 'ブラック';
      case ThemeType.amber:
        return 'アンバー';
      case ThemeType.blueGrey:
        return 'ブルーグレー';
      case ThemeType.deepOrange:
        return 'ディープオレンジ';
      case ThemeType.deepPurple:
        return 'ディープパープル';
      case ThemeType.lime:
        return 'ライム';
      case ThemeType.pink:
        return 'ピンク';
      case ThemeType.teal:
        return 'ティール';
    }
  }

  ThemeType getNext() {
    switch (this) {
      case ThemeType.orange:
        return ThemeType.red;
      case ThemeType.red:
        return ThemeType.purple;
      case ThemeType.purple:
        return ThemeType.blue;
      case ThemeType.blue:
        return ThemeType.lightBlue;
      case ThemeType.lightBlue:
        return ThemeType.cyan;
      case ThemeType.cyan:
        return ThemeType.green;
      case ThemeType.green:
        return ThemeType.lightGreen;
      case ThemeType.lightGreen:
        return ThemeType.indigo;
      case ThemeType.indigo:
        return ThemeType.grey;
      case ThemeType.grey:
        return ThemeType.brown;
      case ThemeType.brown:
        return ThemeType.black;
      case ThemeType.black:
        return ThemeType.amber;
      case ThemeType.amber:
        return ThemeType.blueGrey;
      case ThemeType.blueGrey:
        return ThemeType.deepOrange;
      case ThemeType.deepOrange:
        return ThemeType.deepPurple;
      case ThemeType.deepPurple:
        return ThemeType.lime;
      case ThemeType.lime:
        return ThemeType.pink;
      case ThemeType.pink:
        return ThemeType.teal;
      case ThemeType.teal:
        return ThemeType.orange;
    }
  }

  ThemeType getPrevious() {
    switch (this) {
      case ThemeType.orange:
        return ThemeType.teal;
      case ThemeType.red:
        return ThemeType.orange;
      case ThemeType.purple:
        return ThemeType.red;
      case ThemeType.blue:
        return ThemeType.purple;
      case ThemeType.lightBlue:
        return ThemeType.blue;
      case ThemeType.cyan:
        return ThemeType.lightBlue;
      case ThemeType.green:
        return ThemeType.cyan;
      case ThemeType.lightGreen:
        return ThemeType.green;
      case ThemeType.indigo:
        return ThemeType.lightGreen;
      case ThemeType.grey:
        return ThemeType.indigo;
      case ThemeType.brown:
        return ThemeType.grey;
      case ThemeType.black:
        return ThemeType.brown;
      case ThemeType.amber:
        return ThemeType.black;
      case ThemeType.blueGrey:
        return ThemeType.amber;
      case ThemeType.deepOrange:
        return ThemeType.blueGrey;
      case ThemeType.deepPurple:
        return ThemeType.deepOrange;
      case ThemeType.lime:
        return ThemeType.deepPurple;
      case ThemeType.pink:
        return ThemeType.lime;
      case ThemeType.teal:
        return ThemeType.pink;
    }
  }

  static Color fromEnumToColor(ThemeType themeType) {
    switch (themeType) {
      case ThemeType.orange:
        return Colors.orange;
      case ThemeType.red:
        return Colors.red;
      case ThemeType.purple:
        return Colors.purple;
      case ThemeType.blue:
        return Colors.blue;
      case ThemeType.lightBlue:
        return Colors.lightBlue;
      case ThemeType.cyan:
        return Colors.cyan;
      case ThemeType.green:
        return Colors.green;
      case ThemeType.lightGreen:
        return Colors.lightGreen;
      case ThemeType.indigo:
        return Colors.indigo;
      case ThemeType.grey:
        return Colors.grey;
      case ThemeType.brown:
        return Colors.brown;
      case ThemeType.black:
        return Colors.black;
      case ThemeType.amber:
        return Colors.amber;
      case ThemeType.blueGrey:
        return Colors.blueGrey;
      case ThemeType.deepOrange:
        return Colors.deepOrange;
      case ThemeType.deepPurple:
        return Colors.deepPurple;
      case ThemeType.lime:
        return Colors.lime;
      case ThemeType.pink:
        return Colors.pink;
      case ThemeType.teal:
        return Colors.teal;
    }
  }
}
