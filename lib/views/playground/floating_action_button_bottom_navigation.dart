import 'package:flutter/material.dart';

class FloatingActionButtonBottomNavigation extends StatefulWidget {
  const FloatingActionButtonBottomNavigation({super.key});

  @override
  State<StatefulWidget> createState() => _FloatingActionButtonBottomNavigation();
}

class _FloatingActionButtonBottomNavigation extends State<FloatingActionButtonBottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.send),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.redAccent,
        shape: const CircularNotchedRectangle(),
        notchMargin: 5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            IconButton(
              icon: const Icon(Icons.search, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.print, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.people, color: Colors.white),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
