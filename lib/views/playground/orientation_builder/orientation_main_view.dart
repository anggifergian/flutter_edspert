import 'package:flutter/material.dart';
import 'package:flutter_edspert/views/playground/orientation_builder/orientation_detail_view.dart';
import 'package:flutter_edspert/views/playground/orientation_builder/orientation_detail_view_component.dart';
import 'package:flutter_edspert/views/playground/orientation_builder/orientation_list_view.dart';

class OrientationMainView extends StatefulWidget {
  const OrientationMainView({Key? key}) : super(key: key);

  @override
  State<OrientationMainView> createState() => _OrientationMainViewState();
}

class _OrientationMainViewState extends State<OrientationMainView> {
  var selectedValue = 0;
  var isLargeScreen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: OrientationBuilder(
        builder: (context, orientation) {
          debugPrint("Orientation=${orientation.toString()}");
          debugPrint("MediaContext=${MediaQuery.of(context).orientation}");

          if (MediaQuery.of(context).size.width > 600) {
            isLargeScreen = true;
          } else {
            isLargeScreen = false;
          }

          return Row(
            children: [
              Expanded(
                child: OrientationListView(
                  count: 20,
                  onItemSelected: (valueFromList) {
                    if (isLargeScreen) {
                      selectedValue = valueFromList;
                      setState(() {});
                      return;
                    }

                    var route = MaterialPageRoute(builder: (context) => OrientationDetailView(data: valueFromList));
                    Navigator.push(context, route);
                  },
                ),
              ),
              isLargeScreen ? Expanded(child: OrientationDetailViewComponent(data: selectedValue)) : Container(),
            ],
          );
        },
      ),
    );
  }
}
