import 'package:flutter/material.dart';

typedef ItemSelectedCallback = Null Function(int value);

class OrientationListView extends StatefulWidget {
  const OrientationListView({
    Key? key,
    required this.count,
    required this.onItemSelected,
  }) : super(key: key);

  final int count;
  final ItemSelectedCallback onItemSelected;

  @override
  State<OrientationListView> createState() => _OrientationListViewState();
}

class _OrientationListViewState extends State<OrientationListView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: ListView.separated(
        itemCount: widget.count,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Card(
              child: InkWell(
                onTap: () {
                  widget.onItemSelected(index);
                },
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        index.toString(),
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) =>
            const Padding(padding: EdgeInsets.symmetric(vertical: 4)),
      ),
    );
  }
}
