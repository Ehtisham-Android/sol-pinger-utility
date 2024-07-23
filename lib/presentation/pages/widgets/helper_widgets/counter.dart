import 'package:flutter/material.dart';
import 'package:sol_pinger_utility/core/AppGlobals.dart';

import '../../../../core/constants/constants.dart';

class CounterWidget extends StatefulWidget {
  final int initNumber;
  final Function(int) counterCallback;
  final VoidCallback increaseCallback;
  final VoidCallback decreaseCallback;
  final int minNumber;
  final int maxNumber;

  const CounterWidget({super.key,
    required this.initNumber,
    required this.counterCallback,
    required this.increaseCallback,
    required this.decreaseCallback,
    required this.minNumber, required this.maxNumber});

  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  late int _currentCount;
  late Function _counterCallback;
  late Function _increaseCallback;
  late Function _decreaseCallback;
  late int _minNumber;
  late int _maxNumber;

  @override
  void initState() {
    _currentCount = widget.initNumber;
    _counterCallback = widget.counterCallback;
    _increaseCallback = widget.increaseCallback;
    _decreaseCallback = widget.decreaseCallback;
    _minNumber = widget.minNumber;
    _maxNumber = widget.maxNumber;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimens.radiusXLarge),
        color: AppColors.grey_300,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _createIncrementDecrementButton(Icons.remove, () => _decrement()),
          Text(_currentCount.toString()),
          _createIncrementDecrementButton(Icons.add, () => _increment()),
        ],
      ),
    );
  }

  void _increment() {
    setState(() {
      if (_currentCount < _maxNumber) {
        _currentCount++;
        _counterCallback(_currentCount);
        _increaseCallback();
      }
    });
  }

  void _decrement() {
    setState(() {
      if (_currentCount > _minNumber) {
        _currentCount--;
        _counterCallback(_currentCount);
        _decreaseCallback();
      }
    });
  }

  Widget _createIncrementDecrementButton(IconData icon, onPressedCallback) {
    return RawMaterialButton(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      constraints: const BoxConstraints(minWidth: 42.0, minHeight: 42.0),
      onPressed: onPressedCallback,
      elevation: 2.0,
      fillColor: AppColors.primaryDark,
      shape: const CircleBorder(),
      child: Icon(
        icon,
        color: AppColors.white,
        size: 25.0,
      ),
    );
  }
}
