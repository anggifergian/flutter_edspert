import 'package:flutter/cupertino.dart';

class MediaQueryPlayground extends StatelessWidget {
  const MediaQueryPlayground({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
          decoration: BoxDecoration(border: Border.all()),
          child: Center(
            child: Text("Width: ${MediaQuery.of(context).size.width}"),
          ),
        ),
      ),
    );
  }
}
