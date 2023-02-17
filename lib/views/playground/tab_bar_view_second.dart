import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';

class TabBarViewSecond extends StatefulWidget {
  const TabBarViewSecond({super.key});

  @override
  State<TabBarViewSecond> createState() => _TabBarViewSecondState();
}

class _TabBarViewSecondState extends State<TabBarViewSecond>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late final Ticker _ticker;
  Duration _escapedDuration = Duration.zero;

  get _escapedSeconds => _escapedDuration.inSeconds.toString();

  @override
  void initState() {
    super.initState();
    debugPrint('Tabbar 2 initState');

    _ticker = createTicker((elapsed) {
      if (elapsed.inSeconds - _escapedDuration.inSeconds == 1) {
        setState(() {
          _escapedDuration = elapsed;
        });
      }
    });

    _ticker.start();
  }

  @override
  void dispose() {
    debugPrint('Tabbar 2 disponse');
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CupertinoTabView(
      builder: (context) => CupertinoPageScaffold(
        child: SafeArea(
          child: Container(
            margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
            decoration: BoxDecoration(
              border: Border.all(color: CupertinoColors.activeBlue),
            ),
            child: Center(
              child: Text("Seconds: $_escapedSeconds"),
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
