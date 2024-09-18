import 'dart:async';
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'moviedetails.dart';

class Trendingslider extends StatefulWidget {
  const Trendingslider({
    super.key,
  });

  @override
  State<Trendingslider> createState() => _TrendingsliderState();
}

class _TrendingsliderState extends State<Trendingslider> {
  @override
  void initState() {
    fetchTrending();
    super.initState();
  }

  Future<void> fetchTrending() async {
    final uri = Uri.parse(
        'https://api.themoviedb.org/3/movie/popular?api_key=57a6a8b303c91ef86a581d9014b84829');
    final response = await http.get(uri);
    setState(() {
      body = jsonDecode(response.body);
      len = body['results'].length;
      for (int i = 0; i < len; i++) {
        pics.add(Image.network(
          "https://image.tmdb.org/t/p/w200/${body['results'][i]['poster_path']}",
          filterQuality: FilterQuality.medium,
          fit: BoxFit.cover,
        ));
      }
    });
  }

  dynamic body;
  int len = 0;
  List<Image> pics = [];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: CarouselSlider.builder(
            itemCount: len,
            options: CarouselOptions(
              height: 300,
              autoPlay: true,
              viewportFraction: .55,
              autoPlayCurve: Curves.fastOutSlowIn,
              pageSnapping: true,
              enlargeCenterPage: true,
              autoPlayAnimationDuration: const Duration(seconds: 1),
            ),
            itemBuilder: (context, itemIndex, pageViewIndex) {
              return InkWell(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Container(
                    height: 300,
                    width: 200,
                    color: Colors.amber,
                    child: pics.isEmpty
                        ? Center(
                            child: Text(
                              "LOADING..",
                              style: GoogleFonts.aBeeZee(
                                  fontSize: 25,
                                  color:
                                      const Color.fromARGB(255, 12, 86, 165)),
                            ),
                          )
                        : pics[itemIndex],
                  ),
                ),
                onTap: () {
                   Navigator.push(
                 context,
             MaterialPageRoute(builder: (context) =>Moviedetails(pics[itemIndex],body,itemIndex)),
  ); 
                },
              );
            }));
  }
}
