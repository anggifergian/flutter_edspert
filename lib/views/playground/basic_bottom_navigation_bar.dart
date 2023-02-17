import 'package:flutter/cupertino.dart';
import 'package:flutter_edspert/views/playground/tab_bar_view_first.dart';
import 'package:flutter_edspert/views/playground/tab_bar_view_second.dart';

class BasicBottomNavigationBar extends StatefulWidget {
  const BasicBottomNavigationBar({super.key});

  @override
  State<StatefulWidget> createState() => BasicBottomNavigationBarState();
}

class BasicBottomNavigationBarState extends State<BasicBottomNavigationBar> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.person), label: 'Profile'),
        ],
      ),
      tabBuilder: (context, index) {
        return [
          const TabBarViewFirst(),
          const TabBarViewSecond(),
        ][index];
      },
    );
  }
}
