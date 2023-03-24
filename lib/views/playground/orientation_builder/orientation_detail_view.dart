import 'package:flutter/material.dart';
import 'package:flutter_edspert/views/playground/orientation_builder/orientation_detail_view_component.dart';

class OrientationDetailView extends StatelessWidget {
  const OrientationDetailView({Key? key, required this.data}) : super(key: key);

  final int data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: OrientationDetailViewComponent(data: data),
    );
  }
}
