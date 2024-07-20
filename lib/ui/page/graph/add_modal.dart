import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddModal extends StatelessWidget {
  const AddModal({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController bodyWeightController = TextEditingController();
    final TextEditingController bodyFatPercentageController =
        TextEditingController();
    final themeScheme = Theme.of(context).colorScheme;
    return Container(
      height: 280,
      decoration: BoxDecoration(
        color: themeScheme.surface,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'キャンセル',
                    style: TextStyle(
                      color: themeScheme.onSurface,
                      fontSize: 16,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    '完了',
                    style: TextStyle(
                      color: themeScheme.inversePrimary,
                      fontWeight: FontWeight.w900,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            Text(
              DateFormat('MM/dd').format(DateTime.now()),
              style: TextStyle(
                color: themeScheme.inversePrimary,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox.fromSize(size: const Size.fromHeight(8)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  const SizedBox(width: 60, child: Text('体重')),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextFormField(
                      cursorColor: themeScheme.inversePrimary,
                      controller: bodyWeightController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const SizedBox(width: 20, child: Text('kg')),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  const SizedBox(width: 60, child: Text('体脂肪率')),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextFormField(
                      cursorColor: themeScheme.inversePrimary,
                      controller: bodyFatPercentageController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const SizedBox(width: 20, child: Text('%')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
