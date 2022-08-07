// Flutter Packages
import 'package:flutter/material.dart';

// Data Models
import '../models/nav_item.dart';
import '../models/nav_style.dart';
import '../models/navigation_label_type.dart';

/// An animated navigation bar.
///
/// The navigation bar consists of a list of navigation items.
/// Each navigation item is a [NavItem] object.
///
/// It animates itself when the [isHidden] property is changed.
///
/// You can customize the navigation style by using
/// [NavStyle] class.
class AnimatedNavBar extends StatelessWidget {
  /// Creates an [AnimatedNavBar] widget.
  ///
  /// [AnimatedNavBar] is stateless, so selectedIndex must be provided.
  const AnimatedNavBar({
    super.key,
    required this.items,
    required this.selectedIndex,
    this.onNavigationChanged,
    this.navigationStyle = const NavStyle(),
    this.isHidden = false,
  });

  /// The items to display in the navigation bar.
  final List<NavItem> items;

  /// The index of the selected item.
  final int selectedIndex;

  /// The callback for when the selected item changes.
  final void Function(int)? onNavigationChanged;

  /// The visual styling of the navigation bar.
  ///
  /// Defaults to `NavStyle()`.
  final NavStyle navigationStyle;

  /// Whether the navigation bar is hidden.
  ///
  /// Defaults to `false`.
  final bool isHidden;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (child, animation) => FadeTransition(
        opacity: animation,
        child: SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 1),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        ),
      ),
      child: isHidden ? const SizedBox.shrink() : _buildNavBar(context),
    );
  }

  Widget _buildNavBar(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        navigationBarTheme: NavigationBarThemeData(
          indicatorColor: navigationStyle.indicatorColor,
          labelTextStyle: MaterialStateProperty.all<TextStyle?>(
            navigationStyle.labelTextStyle,
          ),
          backgroundColor: navigationStyle.backgroundColor,
          elevation: navigationStyle.elevation,
          height: navigationStyle.bottomNavHeight,
          labelBehavior: _getNavBarLabelBehavior(),
        ),
      ),
      child: NavigationBar(
        selectedIndex: selectedIndex,
        destinations: [
          for (final item in items)
            NavigationDestination(
              icon: item.icon,
              label: item.label,
              selectedIcon: item.selectedIcon,
            ),
        ],
        onDestinationSelected: onNavigationChanged,
      ),
    );
  }

  NavigationDestinationLabelBehavior _getNavBarLabelBehavior() {
    switch (navigationStyle.labelType) {
      case NavigationLabelType.showAll:
        return NavigationDestinationLabelBehavior.alwaysShow;
      case NavigationLabelType.onlyShowSelected:
        return NavigationDestinationLabelBehavior.onlyShowSelected;
      case NavigationLabelType.hideAll:
        return NavigationDestinationLabelBehavior.alwaysHide;
    }
  }
}
