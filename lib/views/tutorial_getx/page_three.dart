import 'package:flutter/cupertino.dart';
import 'package:flutter_edspert/views/tutorial_getx/page_one.dart';
import 'package:get/get.dart';

class PageThree extends StatelessWidget {
  const PageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Page Three'),
      ),
      child: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: CupertinoColors.activeOrange),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Page Three'),
                    const SizedBox(
                      height: 10,
                    ),
                    CupertinoButton.filled(
                      onPressed: () {
                        Get.off(() => const PageOne());
                      },
                      child: const Text('Back'),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
