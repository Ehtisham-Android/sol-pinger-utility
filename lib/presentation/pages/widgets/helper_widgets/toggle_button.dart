import 'package:flutter/material.dart';
import 'package:sol_pinger_utility/core/AppGlobals.dart';

import '../../add_url_screen.dart';

class ToggleButtonsSample extends StatefulWidget {
  const ToggleButtonsSample({super.key, required this.list, required this.values});

  final List<Widget> list;
  final List<String> values;

  @override
  State<ToggleButtonsSample> createState() => _ToggleButtonsSampleState();
}

class _ToggleButtonsSampleState extends State<ToggleButtonsSample> {
  bool vertical = false;
  final List<bool> selectedItem = <bool>[true, false];

  // List<bool> populateSelectedList() {
  //   List<bool> result = [];
  //   widget.list.asMap().forEach((index, item) {
  //     result.add(index == 0);
  //   });
  //   return result;
  // }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ToggleButtons(
            direction: vertical ? Axis.vertical : Axis.horizontal,
            onPressed: (int index) {
              setState(() {
                for (int i = 0; i < selectedItem.length; i++) {
                  selectedItem[i] = i == index;
                  selectedUrlType = widget.values[index];
                }
              });
            },
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            // selectedBorderColor: Colors.red[700],
            // selectedColor: Colors.white,
            // fillColor: Colors.red[200],
            // color: Colors.red[400],
            selectedBorderColor: AppColors.primaryDark,
            selectedColor: AppColors.grey_200,
            fillColor: AppColors.primaryLight,
            color: AppColors.primaryLight,
            constraints: const BoxConstraints(
              minHeight: 40.0,
              minWidth: 80.0,
            ),
            isSelected: selectedItem,
            children: widget.list,
          ),
        ],
      ),
    );
  }
}
