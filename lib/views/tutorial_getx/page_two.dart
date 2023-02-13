import 'package:flutter/cupertino.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Page Two'),
        trailing: Icon(CupertinoIcons.info),
      ),
      child: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: CupertinoColors.activeGreen),
            borderRadius: BorderRadius.circular(20),
          ),
          margin: const EdgeInsets.all(10),
          child: const Center(
            child: Text('Page Two'),
          ),
        ),
      ),
    );
  }
}
