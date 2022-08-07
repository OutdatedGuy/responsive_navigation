// Flutter Package
import 'package:flutter/material.dart';

// Data Models
import '../models/nav_item.dart';
import '../models/nav_style.dart';
import '../models/navigation_label_type.dart';

/// An animated navigation rail / side navbar.
///
/// The navigation rail consists of a list of navigation items.
/// Each navigation item is a [NavItem] object.
///
/// It animates itself when the [isHidden] property is changed.
///
/// You can customize the navigation style by using
/// [NavStyle] class.
///
/// The navigation rail is positioned on the left side of the screen.
///
/// If [isExtended] is `true`, the navigation rail width is extended.
class AnimatedNavRail extends StatelessWidget {
  /// Creates an [AnimatedNavRail] widget.
  ///
  /// [AnimatedNavRail] is stateless, so selectedIndex must be provided.
  const AnimatedNavRail({
    super.key,
    required this.items,
    required this.selectedIndex,
    this.onNavigationChanged,
    this.navigationStyle = const NavStyle(),
    this.isHidden = false,
    this.isExtended = false,
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

  /// Whether the side navigation is extended.
  ///
  /// Defaults to `false`.
  final bool isExtended;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (child, animation) => FadeTransition(
        opacity: animation,
        child: SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(-1, 0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        ),
      ),
      child: isHidden
          ? const SizedBox.shrink()
          : LayoutBuilder(
              builder: (context, constraint) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints:
                        BoxConstraints(minHeight: constraint.maxHeight),
                    child: IntrinsicHeight(
                      child: _buildNavRail(isExtended: isExtended),
                    ),
                  ),
                );
              },
            ),
    );
  }

  Widget _buildNavRail({required bool isExtended}) {
    return NavigationRail(
      backgroundColor: navigationStyle.backgroundColor,
      indicatorColor: navigationStyle.indicatorColor,
      elevation: navigationStyle.elevation,
      selectedLabelTextStyle: navigationStyle.labelTextStyle,
      unselectedLabelTextStyle: navigationStyle.labelTextStyle,
      selectedIconTheme: navigationStyle.selectedIconTheme,
      unselectedIconTheme: navigationStyle.unselectedIconTheme,
      extended: isExtended,
      labelType: isExtended ? null : _getNavRailLabelType(),
      selectedIndex: selectedIndex,
      leading: navigationStyle.leading,
      trailing: navigationStyle.trailing,
      destinations: [
        for (final item in items)
          NavigationRailDestination(
            icon: item.icon,
            label: Text(item.label),
            selectedIcon: item.selectedIcon,
            padding: navigationStyle.padding,
          ),
      ],
      onDestinationSelected: onNavigationChanged,
    );
  }

  NavigationRailLabelType _getNavRailLabelType() {
    switch (navigationStyle.labelType) {
      case NavigationLabelType.showAll:
        return NavigationRailLabelType.all;
      case NavigationLabelType.onlyShowSelected:
        return NavigationRailLabelType.selected;
      case NavigationLabelType.hideAll:
        return NavigationRailLabelType.none;
    }
  }
}
