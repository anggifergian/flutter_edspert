import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PageFour extends StatelessWidget {
  const PageFour({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Page Four'),
      ),
      child: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: CupertinoColors.activeGreen),
            borderRadius: BorderRadius.circular(20),
          ),
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(20),
          child: Text("Id: ${Get.parameters['id']}"),
        ),
      ),
    );
  }
}
