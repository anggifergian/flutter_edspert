import 'package:flutter/material.dart';

import 'package:flutter_edspert/models/final_project_app/exercise.dart';
import 'package:flutter_edspert/views/final_project/exercise/components/exercise_card.dart';
import 'package:flutter_edspert/views/final_project/exercise/components/exercise_card_skeleton.dart';

class ExerciseList extends StatefulWidget {
  const ExerciseList({super.key});

  @override
  State<StatefulWidget> createState() => ExerciseListState();
}

class ExerciseListState extends State<ExerciseList> {
  bool _isLoading = false;
  final List<Exercise> _items = [
    Exercise(
        exerciseId: "28",
        exerciseTitle: "Huruf Kapital",
        accessType: "",
        icon: "",
        exerciseUserStatus: "",
        jumlahSoal: "10",
        jumlahDone: 10),
    Exercise(
        exerciseId: "29",
        exerciseTitle: "Tanda Baca",
        accessType: "",
        icon: "",
        exerciseUserStatus: "",
        jumlahSoal: "",
        jumlahDone: 10)
  ];

  void performFetch() async {
    setState(() {
      _isLoading = true;
    });
    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();

    performFetch();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading == true
        ? GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.35,
              mainAxisSpacing: 14,
              crossAxisSpacing: 12,
            ),
            itemCount: 3,
            itemBuilder: (context, index) => const ExerciseCardSkeleton())
        : GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.35,
              mainAxisSpacing: 14,
              crossAxisSpacing: 12,
            ),
            itemCount: _items.length,
            itemBuilder: (context, index) => ExerciseCard(
                  exercise: _items[index],
                ));
  }
}
