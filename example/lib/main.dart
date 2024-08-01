// Flutter Packages
import 'package:flutter/material.dart';

// This Package
import 'package:responsive_navigation/responsive_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.purple,
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveNav(
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
          thickness: 5,
        ),
        indicatorColor: Colors.yellow,
        labelType: NavigationLabelType.showAll,
        backgroundColor: Colors.deepPurple,
      ),
      child: Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
