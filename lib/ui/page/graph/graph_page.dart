import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:moufu/ui/page/graph/add_modal.dart';
import 'package:moufu/ui/page/graph/can_slide_chart.dart';
import 'package:moufu/ui/utils/get_addmod_id.dart';

class GraphPage extends StatelessWidget {
  const GraphPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeScheme = Theme.of(context).colorScheme;
    final bannerId = getAdBannerUnitId();
    BannerAd myBanner = BannerAd(
        adUnitId: bannerId,
        size: AdSize.banner,
        request: const AdRequest(),
        listener: const BannerAdListener());
    myBanner.load();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: themeScheme.inversePrimary,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: const AddModal(),
                );
              });
        },
        foregroundColor: themeScheme.onPrimary,
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 55,
        color: themeScheme.primaryContainer,
        surfaceTintColor: Colors.transparent,
        notchMargin: 10,
        shape: const AutomaticNotchedShape(
          RoundedRectangleBorder(),
          StadiumBorder(
            side: BorderSide(),
          ),
        ),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings,
            ),
          ),
        ],
      ),
      body: const SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 8, bottom: 32, right: 20),
                child: CanSlideChart(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
