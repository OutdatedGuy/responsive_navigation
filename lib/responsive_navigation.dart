/// A library to make your app's navigation responsive and easy.
///
/// It's based on [NavigationBar] and [NavigationRail] widgets.
///
/// ## Usage
/// ```dart
/// import 'package:responsive_navigation/responsive_navigation.dart';
///
/// ...
///
/// ResponsiveNav(
///  items: [
///    NavItem(
///      icon: Icon(Icons.home),
///      label: 'Home',
///    ),
///    NavItem(
///      icon: Icon(Icons.search),
///      label: 'Search',
///    ),
///    NavItem(
///      icon: Icon(Icons.settings),
///      label: 'Settings',
///    ),
///  ],
///  child: Scaffold(
///    body: Center(
///      child: Text('Hello World'),
///    ),
///  ),
/// );
/// ```
library responsive_navigation;

import 'package:flutter/material.dart';

// Exporting Data Models
export 'src/models/nav_item.dart';
export 'src/models/nav_style.dart';
export 'src/models/navigation_label_type.dart';

// Exporting Widgets
export 'src/navs/responsive_nav.dart';
