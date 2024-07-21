import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:moufu/ui/controller/add_modal_controller.dart';

class AddModal extends ConsumerWidget {
  const AddModal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeScheme = Theme.of(context).colorScheme;
    final state = ref.watch(addModalControllerProvider);
    final notifier = ref.watch(addModalControllerProvider.notifier);
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
                  onPressed: () {
                    if (notifier.bodyWeightController.text.isEmpty) {
                      return;
                    }
                    notifier.saveData();
                    Navigator.pop(context);
                  },
                  child: Text(
                    '保存',
                    style: TextStyle(
                      color: themeScheme.inversePrimary,
                      fontWeight: FontWeight.w900,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            TextButton.icon(
              onPressed: () {
                showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2020),
                    lastDate: DateTime.now(),
                    builder: (context, child) => Theme(
                          data: ThemeData.light().copyWith(
                            colorScheme: ColorScheme.light(
                              primary: themeScheme.inversePrimary,
                              onPrimary: themeScheme.onPrimary,
                              surface: themeScheme.surface,
                            ),
                            dialogBackgroundColor: themeScheme.surface,
                          ),
                          child: child!,
                        )).then((value) {
                  if (value != null) {
                    notifier.changeDate(value);
                  }
                });
              },
              label: Text(
                DateFormat('yyyy/MM/dd').format(state.date),
                style: TextStyle(
                  color: themeScheme.inversePrimary,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              icon: Icon(
                Icons.calendar_today,
                color: themeScheme.inversePrimary,
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
                      autofocus: true,
                      textInputAction: TextInputAction.next,
                      cursorColor: themeScheme.inversePrimary,
                      controller: notifier.bodyWeightController,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^\d+(\.\d*)?')),
                      ],
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
                      textInputAction: TextInputAction.done,
                      cursorColor: themeScheme.inversePrimary,
                      controller: notifier.bodyFatPercentageController,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^\d+(\.\d*)?')),
                      ],
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
