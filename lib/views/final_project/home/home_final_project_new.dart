import 'package:flutter/cupertino.dart';

class HomeFinalProjectNew extends StatelessWidget {
  const HomeFinalProjectNew({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: _buildListView(context),
      ),
    );
  }

  Widget _buildListView(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.02),
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.02),
      decoration: BoxDecoration(border: Border.all()),
      child: ListView(
        addAutomaticKeepAlives: false,
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.02),
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.02),
            decoration: BoxDecoration(border: Border.all()),
            child: const Text('Container 1'),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.02),
            decoration: BoxDecoration(border: Border.all()),
            child: const Text('Container 2'),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.02),
            decoration: BoxDecoration(border: Border.all()),
            child: const Text('Container 1'),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.02),
            decoration: BoxDecoration(border: Border.all()),
            child: const Text('Container 1'),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.02),
            decoration: BoxDecoration(border: Border.all()),
            child: const Text('Container 1'),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.02),
            decoration: BoxDecoration(border: Border.all()),
            child: const Text('Container 1'),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.02),
            decoration: BoxDecoration(border: Border.all()),
            child: const Text('Container 1'),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.02),
            decoration: BoxDecoration(border: Border.all()),
            child: const Text('Container 1'),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.02),
            decoration: BoxDecoration(border: Border.all()),
            child: const Text('Container 1'),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.02),
            decoration: BoxDecoration(border: Border.all()),
            child: const Text('Container 1'),
          ),
        ],
      ),
    );
  }
}
