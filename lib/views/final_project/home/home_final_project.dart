import 'package:flutter/material.dart';
import 'package:flutter_edspert/views/final_project/course/course_list.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter_edspert/configs/theme.dart';
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
  final double _basePadding = 20;

  _fetchBanners() {
    Provider.of<HomeProvider>(context, listen: false).getAll();
  }

  _fetchCourses() {
    Provider.of<CourseProvider>(context, listen: false).getAll(context: context);
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
    return MaterialApp(
      theme: lightTheme(context),
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildProfileBar(),
                _buildWelcomeBanner(),
                _buildCourseOverviewTitle(),
                _buildCourseOverview(),
                _buildCarouselTitle(),
                _buildCarouselView(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileBar() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: _basePadding, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hai, Anggi',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              Text(
                'Selamat Datang',
                style: GoogleFonts.poppins(),
              ),
            ],
          ),
          const Image(
            image: AssetImage('assets/images/ic_avatar.png'),
            fit: BoxFit.contain,
            width: 50,
          ),
        ],
      ),
    );
  }

  Widget _buildWelcomeBanner() {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xFF3A7FD5),
      ),
      margin: EdgeInsets.only(
        left: _basePadding,
        right: _basePadding,
        top: 4,
        bottom: 16,
      ),
      child: Row(
        children: [
          Flexible(
            child: Container(
              padding: const EdgeInsets.only(left: 30, right: 10),
              child: Text(
                'Mau kerjain latihan soal apa hari ini?',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const Image(
            image: AssetImage('assets/images/img_home.png'),
            fit: BoxFit.contain,
            width: 200,
          ),
        ],
      ),
    );
  }

  Widget _buildCourseOverview() {
    return Container(
      margin: EdgeInsets.only(
        left: _basePadding,
        right: _basePadding,
        bottom: _basePadding,
        top: 10,
      ),
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 3,
        separatorBuilder: (context, index) => const Padding(padding: EdgeInsets.symmetric(vertical: 8)),
        itemBuilder: (context, index) => Provider.of<CourseProvider>(context).course!.isEmpty
            ? const CourseCardSkeleton()
            : CourseCard(course: Provider.of<CourseProvider>(context).course![index]),
      ),
    );
  }

  Widget _buildCarouselView() {
    if (Provider.of<HomeProvider>(context).isLoading) {
      return const SizedBox.shrink();
    }

    return Container(
      margin: EdgeInsets.only(
        left: _basePadding,
        right: _basePadding,
        bottom: _basePadding,
        top: 10,
      ),
      height: 150,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.zero,
        itemCount: Provider.of<HomeProvider>(context).banners.length,
        separatorBuilder: (BuildContext context, int index) {
          return const Padding(padding: EdgeInsets.symmetric(horizontal: 10));
        },
        itemBuilder: (context, index) => SizedBox(
          width: MediaQuery.of(context).size.width * 0.75,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl: Provider.of<HomeProvider>(context).banners[index].eventImage!,
              fit: BoxFit.cover,
              errorWidget: (context, url, error) => const Icon(Icons.shield),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCourseOverviewTitle() {
    return Container(
      margin: EdgeInsets.only(
        left: _basePadding,
        right: _basePadding,
        bottom: 5,
        top: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Pilih Pelajaran',
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          GestureDetector(
            onTap: () {
              var route = MaterialPageRoute(builder: (context) => const CourseList());
              Navigator.of(context).push(route);
            },
            child: Text(
              'Lihat semua',
              style: GoogleFonts.poppins(
                color: const Color(0xFF3A7FD5),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCarouselTitle() {
    return Container(
      padding: EdgeInsets.only(
        left: _basePadding,
        right: _basePadding,
        bottom: 5,
        top: 5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Terbaru',
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
