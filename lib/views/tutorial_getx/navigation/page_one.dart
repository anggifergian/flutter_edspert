import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:flutter_edspert/views/tutorial_getx/navigation/page_two.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  void _goToPageTwo() {
    Get.to(() => const PageTwo());
  }

  void _goToPageThree() {
    Get.offNamed('/page-three');
  }

  void _goToPageFour() {
    Get.toNamed("/page-four/${Random().nextInt(10)}");
  }

  void _goToPageFive() {
    Get.toNamed("/page-five", arguments: {
      "title": Random().nextInt(10).toString(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: CupertinoColors.activeBlue),
                  borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.05 + 6),
                ),
                margin: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildNavigateUsingScreenClasses(context),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    _buildNavigateUsingNamedRoutes(context),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    _buildNavigateWithParams(context),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    _buildNavigateWithArguments(context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigateUsingScreenClasses(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: CupertinoColors.activeGreen),
              borderRadius: BorderRadius.circular(12),
            ),
            margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
            child: Column(
              children: [
                const Text(
                  'Navigate using Screen Classes & Enabled Go Back',
                  style: TextStyle(
                    color: CupertinoColors.activeGreen,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                CupertinoButton.filled(
                  onPressed: _goToPageTwo,
                  child: const Text('Page Two'),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildNavigateUsingNamedRoutes(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: CupertinoColors.activeOrange),
              borderRadius: BorderRadius.circular(12),
            ),
            margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
            child: Column(
              children: [
                const Text(
                  'Navigate using Named Routes & Disabled Go Back',
                  style: TextStyle(
                    color: CupertinoColors.activeOrange,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                CupertinoButton.filled(
                  onPressed: _goToPageThree,
                  child: const Text('Page Three'),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildNavigateWithParams(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: CupertinoColors.systemYellow),
              borderRadius: BorderRadius.circular(12),
            ),
            margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
            child: Column(
              children: [
                const Text(
                  'Navigate with Params',
                  style: TextStyle(
                    color: CupertinoColors.systemYellow,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                CupertinoButton.filled(
                  onPressed: _goToPageFour,
                  child: const Text('Page Four'),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildNavigateWithArguments(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: CupertinoColors.inactiveGray),
              borderRadius: BorderRadius.circular(12),
            ),
            margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
            child: Column(
              children: [
                const Text(
                  'Navigate with Arguments',
                  style: TextStyle(
                    color: CupertinoColors.inactiveGray,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                CupertinoButton.filled(
                  onPressed: _goToPageFive,
                  child: const Text('Page Five'),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
