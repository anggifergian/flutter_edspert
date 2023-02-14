import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomSheetPlayground extends StatelessWidget {
  const BottomSheetPlayground({super.key});

  void _showDialog() async {
    debugPrint('hello world showDialog');
    await Get.dialog(CupertinoAlertDialog(
      title: const Text('Dialog Title'),
      content: const Text('This is the dialog content'),
      actions: [
        CupertinoDialogAction(
          onPressed: () => Get.back(), // Close the dialog
          child: const Text('Close'),
        )
      ],
    ));
  }

  _showSnackBar() {
    Get.snackbar(
      'Snackbar Title',
      'Driver arrived at shop',
      titleText: const Text(
        'Your order will arrived in 20 minutes',
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 16,
        ),
      ),
      duration: const Duration(seconds: 3),
      snackPosition: SnackPosition.TOP,
      snackStyle: SnackStyle.FLOATING,
    );
  }

  void _showBottomSheet() async {
    await Get.bottomSheet(
      Container(
        width: double.infinity,
        height: 300,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: CupertinoColors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Edit'),
              onTap: () {
                debugPrint('Edit');
              },
            ),
            ListTile(
              leading: const Icon(Icons.send),
              title: const Text('Send'),
              onTap: () {
                debugPrint('Send');
              },
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CupertinoButton.filled(
                onPressed: _showDialog,
                child: const Text('Show Dialog'),
              ),
              const SizedBox(height: 10),
              CupertinoButton.filled(
                onPressed: _showSnackBar,
                child: const Text('Show SnackBar'),
              ),
              const SizedBox(height: 10),
              CupertinoButton.filled(
                onPressed: _showBottomSheet,
                child: const Text('Show BottomSheet'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
