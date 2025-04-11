// In action_item.dart
import 'package:flutter/material.dart';

class ActionItem {
  final Widget icon;
  final Function(BuildContext) callback;

  ActionItem({
    required this.icon,
    required this.callback,
  });
}
