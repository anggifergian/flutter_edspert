import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:flutter_edspert/configs/theme.dart';
import 'package:flutter_edspert/providers/course_provider.dart';
import 'package:flutter_edspert/views/final_project/course/components/course_card.dart';
import 'package:flutter_edspert/views/final_project/course/components/course_card_skeleton.dart';

class CourseList extends StatefulWidget {
  const CourseList({super.key});

  @override
  State<StatefulWidget> createState() => CourseListState();
}

class CourseListState extends State<CourseList> {
  void _fetchCourse() {
    Provider.of<CourseProvider>(context, listen: false).getAll();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _fetchCourse();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme(context),
      home: Scaffold(
          appBar: _buildAppBar(context),
          body: Container(
            padding: const EdgeInsets.all(10),
            child: Provider.of<CourseProvider>(context).isLoading
                ? ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index) => (Container(
                          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                          child: const CourseCardSkeleton(),
                        )))
                : ListView.builder(
                    itemCount: Provider.of<CourseProvider>(context).course!.length,
                    itemBuilder: (context, index) => Container(
                          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                          child: CourseCard(course: Provider.of<CourseProvider>(context).course![index]),
                        )),
          )),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
        centerTitle: false,
        title: Text(
          'Pilih Pelajaran',
          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w700),
        ),
        titleSpacing: 0.0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ));
  }
}
