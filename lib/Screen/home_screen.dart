import 'package:api2/services/movies_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../models/movies.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Movie> movies = [];
  @override
  void initState() {
    super.initState();
    fetchMovie();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: movies.length,
          itemBuilder: (context,index){
          final movie = movies[index];
          final name = movie.movie;
          final rating = movie.rating;
          final imdb = movie.imdb_url;
          return Container(
            margin: EdgeInsets.fromLTRB(15,5,15,5),
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20,15,30,15),
              child: Column(
                children: [
                  Text('${name}'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Rating: ${rating}'),
                      SizedBox(width: 20,),
                      InkWell(
                        onTap: (){
                          launcUrl(Uri.parse(imdb));
                        },
                        child: Text('more',style: TextStyle(color: Colors.blue),),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        }
      ),
    );
  }

Future<void> fetchMovie() async{
    final response = await MovieApi.fetchMovie();
    setState(() {
      movies = response;
    });
}

  Future<void> launcUrl(Uri url) async {
    try {
      await launchUrl(url);
    } catch (error) {
      print(error);
    }
  }

}
