//import 'dart:convert';
//import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Moviedetails extends StatelessWidget {
  final Image pic;
  final dynamic body;
  final dynamic index;
  Moviedetails(this.pic, this.body,this.index);

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
        elevation: 12,
      ),
      backgroundColor: const Color.fromARGB(255, 37, 34, 34),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                child: Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 300,
                      child: pic,
                    ),
                    Container(
                      width: double.infinity,
                      height: 300,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromRGBO(0, 0, 0, 0.98),
                            Color.fromRGBO(0, 0, 0, 0.5),
                            Color.fromRGBO(20, 20, 20, 0),
                            Color.fromRGBO(101, 100, 100, 0),
                            Color.fromRGBO(0, 0, 0, 0.5),
                            Color.fromRGBO(0, 0, 0, 0.98),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25,),
              Text('TITLE : ${body['results'][index]['title']}',
              style: GoogleFonts.aBeeZee(fontSize: 25, color: const Color.fromARGB(255, 148, 156, 164)),
                            ),
              const SizedBox(
                height: 15,
              )
              ,
              Text('RELEASE DATE :${body['results'][index]['release_date']}',
              style: GoogleFonts.aBeeZee(fontSize: 25, color: const Color.fromARGB(255, 148, 156, 164)),
                            ),
              const SizedBox(
                height: 15,
              )
              ,
              Text('ORIGINAL LANGUAGE : ${body['results'][index]['original_language']}',
              style: GoogleFonts.aBeeZee(fontSize: 25, color: const Color.fromARGB(255, 148, 156, 164)),
                            ),
            const SizedBox(
                height: 15,
              )
              ,
              Text('AVERAGE VOTE : ${body['results'][index]['vote_average']}',
              style: GoogleFonts.aBeeZee(fontSize: 25, color: const Color.fromARGB(255, 148, 156, 164)),
                            ),

             const SizedBox(
                height: 15,
              )
              ,
              Text('VOTE COUNT : ${body['results'][index]['vote_count']}',
              style: GoogleFonts.aBeeZee(fontSize: 25, color: const Color.fromARGB(255, 148, 156, 164)),
                            ),
              const SizedBox(
                height: 15,
              )
              ,
              Text('DESCRIPTION : ${body['results'][index]['overview']}',
              style: GoogleFonts.aBeeZee(fontSize: 25, color: const Color.fromARGB(255, 148, 156, 164)),
                            ),
              
            ],
          ),
        ),
      ),
    );
  }
}
