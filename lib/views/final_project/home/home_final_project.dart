import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_edspert/configs/theme/cupertino_light_theme.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter_edspert/providers/home_provider.dart';
import 'package:flutter_edspert/providers/course_provider.dart';
import 'package:flutter_edspert/views/final_project/course/components/course_card.dart';
import 'package:flutter_edspert/views/final_project/course/components/course_card_skeleton.dart';

class HomeFinalProject extends StatefulWidget {
  const HomeFinalProject({super.key});

  @override
  State<StatefulWidget> createState() => HomeFinalProjectState();
}

class HomeFinalProjectState extends State<HomeFinalProject> {
  _fetchBanners() {
    Provider.of<HomeProvider>(context, listen: false).getAll();
  }

  _fetchCourses() {
    Provider.of<CourseProvider>(context, listen: false).getAll();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _fetchBanners();
      _fetchCourses();
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: cupertinoLight,
      home: CupertinoPageScaffold(
        child: Column(
          children: [_buildCourseOverview(context), _buildBannerView(context)],
        ),
      ),
    );
  }

  Widget _buildCourseOverview(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      height: MediaQuery.of(context).size.height * 0.5,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Text('Pilih Pelajaran',
                    style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black)),
              ),
              // TextButton(
              //   child: Text(
              //     'Lihat Semua',
              //     style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.lightBlue),
              //   ),
              //   onPressed: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //           builder: (context) => const CourseList(),
              //         ));
              //   },
              // ),
              Container(
                decoration: BoxDecoration(border: Border.all()),
                child: CupertinoButton(
                  onPressed: () {},
                  child: const Text('Lihat semua 2'),
                ),
              )
            ],
          ),
          Expanded(
              child: Provider.of<CourseProvider>(context).course!.isEmpty
                  ? (ListView.separated(
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 3,
                      separatorBuilder: (context, index) => const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                      itemBuilder: (context, index) => const CourseCardSkeleton()))
                  : (ListView.separated(
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 3,
                      separatorBuilder: (context, index) => const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                      itemBuilder: (context, index) =>
                          CourseCard(course: Provider.of<CourseProvider>(context).course![index]))))
        ],
      ),
    );
  }

  Widget _buildBannerView(BuildContext context) {
    if (Provider.of<HomeProvider>(context).isLoading) {
      return const SizedBox.shrink();
    }

    return Container(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 20.0),
        height: MediaQuery.of(context).size.height * 0.25,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
              child: Text(
                'Terbaru',
                style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black),
              ),
            ),
            Expanded(
                child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.zero,
              itemCount: Provider.of<HomeProvider>(context).banners.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
              itemBuilder: (context, index) => SizedBox(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        imageUrl: Provider.of<HomeProvider>(context).banners[index].eventImage!,
                        fit: BoxFit.cover,
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                      ))),
            ))
          ],
        ));
  }
}
