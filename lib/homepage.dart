import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'sections/TopratedSection.dart';
import 'sections/trendingSection.dart';
import 'sections/upcomingSection.dart';

class homepage extends StatefulWidget {
  @override
  State<homepage> createState() => homepageState();
}

class homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 37, 34, 34),
        title: const Text(
          "MOVIEFLIX",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: const Color.fromARGB(255, 37, 34, 34),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Trending",
              style: GoogleFonts.aBeeZee(fontSize: 25, color: Colors.white),
            ),
            const SizedBox(height: 16),
            const Trendingslider(),
            const SizedBox(
              height: 16,
            ),
            Text(
              "Top Rated Movies",
              style: GoogleFonts.aBeeZee(fontSize: 25, color: Colors.white),
            ),
            const Toprated(),
            const SizedBox(
              height: 16,
            ),
            Text(
              "Upcoming Movies",
              style: GoogleFonts.aBeeZee(fontSize: 25, color: Colors.white),
            ),
            const Upcoming()
          ],
        ),
      ),
    );
  }
}
