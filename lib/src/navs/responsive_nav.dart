// Flutter packages
import 'package:flutter/material.dart';

// Data Models
import '../models/nav_item.dart';
import '../models/nav_style.dart';

// Widgets
import 'animated_nav_bar.dart';
import 'animated_nav_rail.dart';

/// A responsive navigation bar.
///
/// It shows a [NavigationBar] on small screens and a [NavigationRail] on
/// large screens.
///
/// The navigation bar consists of a list of navigation items.
/// Each navigation item is a [NavItem] object.
///
/// It animates itself when the screen size changes.
///
/// You can customize the navigation style by using
/// [NavStyle] class.
class ResponsiveNav extends StatefulWidget {
  /// Creates a [ResponsiveNav] widget.
  const ResponsiveNav({
    super.key,
    required this.child,
    required this.items,
    this.onNavigationChanged,
    this.intialSelectedIndex,
    this.navigationChangeWidth = 767.0,
    this.shouldExtend = true,
    this.largeScreensWidth = 1200.0,
    this.appBar,
    this.navStyle = const NavStyle(),
  });

  /// The [Widget] to display in the main content.
  final Widget child;

  /// The items to display in the navigation bar.
  final List<NavItem> items;

  /// The callback for when the selected item changes.
  final void Function(int)? onNavigationChanged;

  /// The index of the item to select initially.
  final int? intialSelectedIndex;

  /// The width of the screen at which the [NavigationBar] should be hidden
  /// and the [NavigationRail] should be shown.
  ///
  /// Defaults to `767.0`.
  final double navigationChangeWidth;

  /// Whether the navigation bar should be extended on large screens.
  ///
  /// Defaults to `true`.
  final bool shouldExtend;

  /// The width of the screen at which the [NavigationRail] should be extended,
  /// if [shouldExtend] is `true`.
  ///
  /// Defaults to `1200.0`.
  final double largeScreensWidth;

  /// Use this to display a [AppBar] above the [NavigationRail] and [child].
  ///
  /// If this is not provided, the [NavigationRail] will take up the entire
  /// height of the screen.
  final PreferredSizeWidget? appBar;

  /// The visual styling of the navigation bar.
  ///
  /// Defaults to `NavStyle()`.
  final NavStyle navStyle;

  @override
  State<ResponsiveNav> createState() => _ResponsiveNavState();
}

class _ResponsiveNavState extends State<ResponsiveNav> {
  late int _currentIndex = widget.intialSelectedIndex ?? 0;

  void _onNavigationChanged(int index) {
    setState(() => _currentIndex = index);
    widget.onNavigationChanged?.call(index);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isBigScreen = width > widget.navigationChangeWidth;
    final isExtended = widget.shouldExtend && width > widget.largeScreensWidth;

    return Scaffold(
      appBar: widget.appBar,
      body: Row(
        children: [
          AnimatedNavRail(
            items: widget.items,
            selectedIndex: _currentIndex,
            navigationStyle: widget.navStyle,
            isHidden: !isBigScreen,
            isExtended: isExtended,
            onNavigationChanged: _onNavigationChanged,
          ),
          if (isBigScreen) widget.navStyle.verticalDivider,
          Expanded(child: widget.child),
        ],
      ),
      bottomNavigationBar: AnimatedNavBar(
        items: widget.items,
        selectedIndex: _currentIndex,
        navigationStyle: widget.navStyle,
        isHidden: isBigScreen,
        onNavigationChanged: _onNavigationChanged,
      ),
    );
  }
}
