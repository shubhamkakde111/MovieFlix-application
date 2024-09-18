import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/sections/moviedetails.dart';
class Toprated extends StatefulWidget {
  const Toprated({
    super.key,
  });

  @override
  State<Toprated> createState() => _TopratedState();
}

class _TopratedState extends State<Toprated> {
   @override
  void initState() {
    fetchTrending();
    super.initState();
  }

  Future<void> fetchTrending() async {
    final uri = Uri.parse(
        'https://api.themoviedb.org/3/movie/top_rated?api_key=57a6a8b303c91ef86a581d9014b84829');
    final response = await http.get(uri);
    setState(() {
      body = jsonDecode(response.body);
      len = body['results'].length;
      for (int i = 0; i < len; i++) {
        pics.add(Image.network(
          "https://image.tmdb.org/t/p/w200/${body['results'][i]['poster_path']}",
          filterQuality: FilterQuality.medium,
          fit: BoxFit.fill,
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
      height: 200,
      child: ListView.builder(itemCount:len,scrollDirection: Axis.horizontal,physics:const BouncingScrollPhysics(), itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(15),
          child:InkWell(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Container(
                    color: Colors.amber,
                      height: 200,
                      width: 150,
                      
                      child: pics.isEmpty? Center(child: Text(
                  "LOADING..",
                  style: GoogleFonts.aBeeZee(fontSize: 25, color: const Color.fromARGB(255, 12, 86, 165)),
                ),):pics[index],
                    ),
            ),
              onTap: () {
                   Navigator.push(
                 context,
             MaterialPageRoute(builder: (context) =>Moviedetails(pics[index],body,index)),
  ); 
                },
          ),
        );
      }),
    );
  }
}