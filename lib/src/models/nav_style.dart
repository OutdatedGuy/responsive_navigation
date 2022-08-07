// Flutter Packages
import 'package:flutter/widgets.dart';

// My Packages
import 'package:responsive_navigation/responsive_navigation.dart';

/// The visual styling of the [ResponsiveNav] widget. Contains many
/// customizable properties.
class NavStyle {
  /// Creates a [NavStyle] object.
  const NavStyle({
    this.labelType = NavigationLabelType.showAll,
    this.backgroundColor,
    this.elevation,
    this.labelTextStyle,
    this.selectedIconTheme,
    this.unselectedIconTheme,
    this.verticalDivider = const SizedBox.shrink(),
    this.bottomNavHeight = 60.0,
    this.indicatorColor,
    this.padding = const EdgeInsets.symmetric(vertical: 5),
    this.leading,
    this.trailing,
  });

  /// How to display the labels of the navigation items.
  /// ```dart
  /// enum NavigationLabelType {
  ///   hideAll,
  ///   onlyShowSelected,
  ///   showAll,
  /// }
  /// ```
  ///
  /// Defaults to [NavigationLabelType.showAll].
  final NavigationLabelType labelType;

  /// The background color of the navigation bar.
  final Color? backgroundColor;

  /// The elevation of the navigation bar.
  final double? elevation;

  /// The text style of the labels of the navigation items.
  final TextStyle? labelTextStyle;

  /// The icon theme of the selected navigation item for side navigation.
  final IconThemeData? selectedIconTheme;

  /// The icon theme of the unselected navigation item for side navigation.
  final IconThemeData? unselectedIconTheme;

  /// The vertical divider between side navigation and
  /// [ResponsiveNav.child].
  ///
  /// Defaults to `SizedBox.shrink()`.
  final Widget verticalDivider;

  /// The height of the bottom navigation bar.
  ///
  /// Defaults to `60.0`.
  final double? bottomNavHeight;

  /// The color of the indicator of the selected navigation item.
  final Color? indicatorColor;

  /// The padding of the navigation items for side navigation.
  ///
  /// Defaults to `EdgeInsets.symmetric(vertical: 5)`.
  final EdgeInsetsGeometry? padding;

  /// The leading widget of the side navigation.
  final Widget? leading;

  /// The trailing widget of the side navigation.
  final Widget? trailing;
}
