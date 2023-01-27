import 'package:flutter/material.dart';
import 'package:flutter_edspert/configs/constant.dart';
import 'package:flutter_edspert/models/final_project_app/exercise.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ExerciseCard extends StatelessWidget {
  final Exercise? exercise;

  const ExerciseCard({
    super.key,
    required this.exercise,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print('Hello World'),
      child: Container(
          padding: const EdgeInsets.all(14),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              border: Border.all(
                  width: 0.3,
                  style: BorderStyle.solid,
                  color: secondaryColor10LightTheme),
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(14),
                decoration: const BoxDecoration(
                    color: Color(0xFFF3F7F8),
                    borderRadius: BorderRadius.all(Radius.circular(14))),
                child: SvgPicture.asset(
                  'assets/images/ic_note.svg',
                  height: 22,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "${exercise!.exerciseTitle}",
                style: GoogleFonts.poppins(
                  height: 1.3,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                "${exercise!.jumlahDone}/${exercise!.jumlahSoal} Soal",
                style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Color(0xFF8E8E8E)),
              ),
            ],
          )),
    );
  }
}