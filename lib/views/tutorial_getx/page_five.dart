import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PageFive extends StatelessWidget {
  const PageFive({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Page Five'),
      ),
      child: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: CupertinoColors.inactiveGray),
            borderRadius: BorderRadius.circular(20),
          ),
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(20),
          child: Text("Title: ${Get.arguments['title']}"),
        ),
      ),
    );
  }
}
