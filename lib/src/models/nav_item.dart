// Flutter Packages
import 'package:flutter/widgets.dart';

/// Specification for content of navigation items.
class NavItem {
  /// Creates a [NavItem] object.
  NavItem({
    required this.icon,
    required this.label,
    this.selectedIcon,
  });

  /// The icon of the navigation item.
  final Widget icon;

  /// The label of the navigation item.
  final String label;

  /// The icon of the navigation item when selected.
  final Widget? selectedIcon;
}
