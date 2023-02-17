import 'package:flutter/cupertino.dart';

class TabBarViewFirst extends StatefulWidget {
  const TabBarViewFirst({super.key});

  @override
  State<TabBarViewFirst> createState() => _TabBarViewFirstState();
}

class _TabBarViewFirstState extends State<TabBarViewFirst> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    debugPrint("Tabbar 1 build");
    super.build(context);
    return CupertinoTabView(
      builder: (context2nd) {
        return CupertinoPageScaffold(
          child: SafeArea(
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(border: Border.all()),
                  padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
                  child: Column(
                    children: const [
                      Text('Hi, Altop'),
                      Text('Selamat Datang'),
                    ],
                  ),
                ),
                Expanded(
                  child: _buildListView(context),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildListView(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.02),
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.02),
      decoration: BoxDecoration(
        border: Border.all(color: CupertinoColors.activeBlue),
      ),
      child: ListView.separated(
        // addAutomaticKeepAlives: false,
        // shrinkWrap: true,
        itemCount: 20,
        itemBuilder: (context, index) => Container(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.02,
            vertical: MediaQuery.of(context).size.width * 0.05,
          ),
          decoration: BoxDecoration(border: Border.all()),
          child: Text("Container ${index + 1}"),
        ),
        separatorBuilder: (BuildContext context, int index) =>
            SizedBox(height: MediaQuery.of(context).size.width * 0.025),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
