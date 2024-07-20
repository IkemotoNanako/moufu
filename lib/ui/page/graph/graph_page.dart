import 'package:flutter/material.dart';
import 'package:moufu/ui/page/graph/can_slide_chart.dart';

class GraphPage extends StatelessWidget {
  const GraphPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeScheme = Theme.of(context).colorScheme;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: themeScheme.inversePrimary,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        onPressed: () {},
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
        child: Padding(
          padding: EdgeInsets.only(top: 8, bottom: 32, right: 20),
          child: CanSlideChart(),
        ),
      ),
    );
  }
}
