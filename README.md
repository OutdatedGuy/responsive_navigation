# Responsive Navigation

A HOLISTIC approach to get your Bleeding Edge flutter app to work on all devices.

[![pub package][package_svg]][package]
[![GitHub][license_svg]](LICENSE)

[![GitHub issues][issues_svg]][issues]
[![GitHub issues closed][issues_closed_svg]][issues_closed]

<hr />

| Normal Responsive Navigation      | Navigation Under AppBar            |
| --------------------------------- | ---------------------------------- |
| ![Default Nav][normal_responsive] | ![Nav Under AppBar][under_app_bar] |

| For Very large Screens                      | Slim Navigation all the Time                |
| ------------------------------------------- | ------------------------------------------- |
| ![Nav on Large screens][very_large_screens] | ![Slim nav on Large screens][slim_nav_rail] |

| Crowded Navigation                  | Scrollable Side Navigation                   |
| ----------------------------------- | -------------------------------------------- |
| ![Nav with many items][crowded_nav] | ![Side nav for short height][scrollable_nav] |

## Getting started

#### Add to Dependencies

```yaml
responsive_navigation: ^1.1.0
```

#### Import the package

```dart
import 'package:responsive_navigation/responsive_navigation.dart';
```

## Usage

#### Normal Responsive Navigation

```dart
ResponsiveNav(
  items: [
    NavItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    NavItem(
      icon: Icon(Icons.search),
      label: 'Search',
    ),
    NavItem(
      icon: Icon(Icons.settings),
      label: 'Settings',
    ),
  ],
  child: Scaffold(
    appBar: AppBar(
      title: Text('Normal Responsive Navigation'),
    ),
    body: Center(
      child: Text('Hello World'),
    ),
  ),
);
```

#### Navigation Under AppBar

```dart
ResponsiveNav(
  items: [
    NavItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    NavItem(
      icon: Icon(Icons.search),
      label: 'Search',
    ),
    NavItem(
      icon: Icon(Icons.settings),
      label: 'Settings',
    ),
  ],
  appBar: AppBar(
    title: Text('Navigation Under AppBar'),
  ),
  child: Scaffold(
    body: Center(
      child: Text('Hello World'),
    ),
  ),
);
```

#### Slim Navigation all the Time

```dart
ResponsiveNav(
  items: [
    NavItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    NavItem(
      icon: Icon(Icons.search),
      label: 'Search',
    ),
    NavItem(
      icon: Icon(Icons.settings),
      label: 'Settings',
    ),
  ],
  shouldExtend: false,
  child: Scaffold(
    appBar: AppBar(
      title: Text('Slim Navigation all the Time'),
    ),
    body: Center(
      child: Text('Hello World'),
    ),
  ),
);
```

#### Crowded Navigation

```dart
ResponsiveNav(
  items: [
    NavItem(icon: const Icon(Icons.home), label: 'Home'),
    NavItem(icon: const Icon(Icons.search), label: 'Search'),
    NavItem(icon: const Icon(Icons.person), label: 'Account'),
    NavItem(icon: const Icon(Icons.shopping_cart), label: 'Cart'),
    NavItem(icon: const Icon(Icons.settings), label: 'Settings'),
    NavItem(icon: const Icon(Icons.logout), label: 'Logout'),
    NavItem(icon: const Icon(Icons.help), label: 'Help'),
  ],
  child: Scaffold(
    appBar: AppBar(
      title: Text('Crowded Navigation'),
    ),
    body: Center(
      child: Text('Hello World'),
    ),
  ),
);
```

#### Customized Responsive Navigation

```dart
ResponsiveNav(
  items: [
    NavItem(icon: const Icon(Icons.home), label: 'Home'),
    NavItem(icon: const Icon(Icons.search), label: 'Search'),
    NavItem(icon: const Icon(Icons.person), label: 'Account'),
    NavItem(icon: const Icon(Icons.shopping_cart), label: 'Cart'),
    NavItem(icon: const Icon(Icons.settings), label: 'Settings'),
    NavItem(icon: const Icon(Icons.logout), label: 'Logout'),
    NavItem(icon: const Icon(Icons.help), label: 'Help'),
  ],
  navStyle: NavStyle(
    elevation: 5,
    verticalDivider: VerticalDivider(
      color: Colors.grey.shade300,
      width: 1,
      thickness: 1,
    ),
    indicatorColor: Colors.yellow,
    labelType: NavigationLabelType.showAll,
    backgroundColor: Colors.deepPurple,
  ),
  child: Scaffold(
    body: Center(
      child: Text('Hello World'),
    ),
  ),
);
```

### If you liked the package, then please give it a [Like 👍🏼][package] and [Star ⭐][repository]

<!-- Badges URLs -->

[package_svg]: https://img.shields.io/pub/v/responsive_navigation.svg?color=blueviolet
[license_svg]: https://img.shields.io/github/license/OutdatedGuy/responsive_navigation.svg?color=purple
[lints_svg]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[issues_svg]: https://img.shields.io/github/issues/OutdatedGuy/responsive_navigation.svg
[issues_closed_svg]: https://img.shields.io/github/issues-closed/OutdatedGuy/responsive_navigation.svg?color=green

<!-- Gifs URLs -->

[normal_responsive]: https://user-images.githubusercontent.com/74326345/183288726-87be9476-0f8e-4c0b-abf0-8306409e735d.gif
[under_app_bar]: https://user-images.githubusercontent.com/74326345/183288739-9bf7e9ad-7b83-4cff-a7ce-8de0f1283afe.gif
[very_large_screens]: https://user-images.githubusercontent.com/74326345/183288744-a8f8b15d-ff62-42fc-bd41-7937c778d351.gif
[slim_nav_rail]: https://user-images.githubusercontent.com/74326345/183288747-2d4ad2d2-0850-43c4-9057-b77291f95927.gif
[crowded_nav]: https://user-images.githubusercontent.com/74326345/183288877-be4660ce-e085-4b43-a2ed-c7675385a0ba.gif
[scrollable_nav]: https://user-images.githubusercontent.com/74326345/183288882-13d6a410-bc78-419a-bd17-c6dd6f7d0dd9.gif

<!-- Links -->

[package]: https://pub.dev/packages/responsive_navigation
[repository]: https://github.com/OutdatedGuy/responsive_navigation
[issues]: https://github.com/OutdatedGuy/responsive_navigation/issues
[issues_closed]: https://github.com/OutdatedGuy/responsive_navigation/issues?q=is%3Aissue+is%3Aclosed
