import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExerciseEmpty extends StatelessWidget {
  const ExerciseEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Image(
          image: AssetImage('assets/images/illustrasi.png'),
          fit: BoxFit.contain,
          width: 300,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Text(
            'Yah, Paket tidak tersedia',
            style: GoogleFonts.poppins(fontSize: 24, color: Colors.black87, fontWeight: FontWeight.w500),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Tenang, masih banyak yang bisa kamu pelajari. Cari lagi yuk!',
            style: GoogleFonts.poppins(fontSize: 14),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
