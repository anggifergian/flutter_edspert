import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_edspert/configs/theme.dart';
import 'package:flutter_edspert/providers/exercise_provider.dart';
import 'package:flutter_edspert/views/final_project/exercise/components/exercise_empty.dart';
import 'package:flutter_edspert/views/final_project/exercise/components/exercise_card.dart';
import 'package:flutter_edspert/views/final_project/exercise/components/exercise_card_skeleton.dart';

class ExerciseList extends StatefulWidget {
  final String courseName;
  final String courseID;

  const ExerciseList({super.key, required this.courseName, required this.courseID});

  @override
  State<StatefulWidget> createState() => ExerciseListState();
}

class ExerciseListState extends State<ExerciseList> {
  final double mainAxisSpacing = 16;
  final double crossAxisSpacing = 16;
  final int crossAxisCount = 2;
  final double childAspectRatio = 1;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _fetchExercise();
    });
  }

  _fetchExercise() {
    Provider.of<ExerciseProvider>(context, listen: false).getAll(widget.courseID);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme(context),
      home: Scaffold(
        appBar: _buildAppBar(context),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTitle(),
              _buildGridView(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(
        'Pilih Paket Soal',
        style: GoogleFonts.poppins(fontSize: 16, color: Colors.black87, fontWeight: FontWeight.w700),
      ),
    );
  }

  Widget _buildGridView(BuildContext context) {
    if (Provider.of<ExerciseProvider>(context).isLoading == true) {
      return Expanded(
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              childAspectRatio: childAspectRatio,
              mainAxisSpacing: mainAxisSpacing,
              crossAxisSpacing: crossAxisSpacing,
            ),
            itemCount: 5,
            itemBuilder: (context, index) => const ExerciseCardSkeleton()),
      );
    }

    if (Provider.of<ExerciseProvider>(context).isEmpty == true) {
      return const Expanded(child: ExerciseEmpty());
    }

    return Expanded(
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: childAspectRatio,
            mainAxisSpacing: mainAxisSpacing,
            crossAxisSpacing: crossAxisSpacing,
          ),
          itemCount: Provider.of<ExerciseProvider>(context).exercises!.length,
          itemBuilder: (context, index) => ExerciseCard(
                exercise: Provider.of<ExerciseProvider>(context).exercises![index],
              )),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
        centerTitle: false,
        title: Text(
          widget.courseName,
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
