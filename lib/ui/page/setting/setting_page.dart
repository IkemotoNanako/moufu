import 'package:flutter/material.dart';
import 'package:moufu/ui/page/setting/theme_setting_page.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: themeScheme.onInverseSurface,
      appBar: AppBar(
        backgroundColor: themeScheme.onInverseSurface,
        surfaceTintColor: Colors.transparent,
        title: const Text('設定'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Align(alignment: Alignment.centerLeft, child: Text('見た目')),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ThemeSettingPage()),
                );
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                color: themeScheme.onPrimary,
                child: const Row(
                  children: [
                    Text('カラーテーマ設定', style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child:
                  Align(alignment: Alignment.centerLeft, child: Text('サポート')),
            ),
            InkWell(
              onTap: () {
                launchUrl(
                  Uri.parse('https://forms.gle/NcdSYsBSndz3jNnk6'),
                );
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                color: themeScheme.onPrimary,
                child: const Row(
                  children: [
                    Text('お問い合わせ', style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Align(
                  alignment: Alignment.centerLeft, child: Text('アプリについて')),
            ),
            InkWell(
              onTap: () {
                launchUrl(
                  Uri.parse(
                      'https://midorisaku.wixsite.com/moufu/post/terms-of-use'),
                );
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                color: themeScheme.onPrimary,
                child: const Row(
                  children: [
                    Text('利用規約', style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            ),
            Divider(
              color: themeScheme.inverseSurface,
              thickness: 0.3,
              indent: 16,
              endIndent: 16,
              height: 0,
            ),
            InkWell(
              onTap: () {
                launchUrl(
                  Uri.parse(
                      'https://midorisaku.wixsite.com/moufu/post/privacy-policy'),
                );
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                color: themeScheme.onPrimary,
                child: const Row(
                  children: [
                    Text('プライバシーポリシー', style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            ),
            Divider(
              color: themeScheme.inverseSurface,
              thickness: 0.3,
              indent: 16,
              endIndent: 16,
              height: 0,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LicensePage()),
                );
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                color: themeScheme.onPrimary,
                child: const Row(
                  children: [
                    Text('ライセンス', style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            // const Padding(
            //   padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            //   child: Align(alignment: Alignment.centerLeft, child: Text('その他')),
            // ),
            // InkWell(
            //   onTap: () {},
            //   child: Container(
            //     padding:
            //         const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            //     color: themeScheme.onPrimary,
            //     child: Row(
            //       children: [
            //         Text('退会する',
            //             style:
            //                 TextStyle(fontSize: 16, color: themeScheme.error)),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
