import 'package:flutter/material.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:drump/pages/drum_page.dart';
import 'package:drump/pages/recordings.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

int selectedIndex = 0;
final List<Widget> pages = [
  const DrumPage(),
  //const DrumPage(),
  const Recordings(),
];

class _MyAppState extends State<MyApp> {
  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: pages[selectedIndex],
        bottomNavigationBar: FlashyTabBar(
          selectedIndex: selectedIndex,
          animationCurve: Curves.linear,
          iconSize: 30,
          onItemSelected: _onItemTapped,
          items: [
            FlashyTabBarItem(
                icon: const Icon(Icons.rectangle_rounded),
                title: const Text('Drums'),
                activeColor: Colors.pink,
                inactiveColor: Colors.pink),
            FlashyTabBarItem(
                icon: const Icon(Icons.mic),
                title: const Text('Recordings'),
                activeColor: Colors.purple,
                inactiveColor: Colors.purple),
            
          ],
        ),
      ),
    );
  }
}
