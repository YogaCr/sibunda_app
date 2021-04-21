import 'package:flutter/widgets.dart';

class MovieCard extends StatelessWidget {
  //final Movie movie;
  //final Function onTap;

  //MovieCard({this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: 210,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
              //image: NetworkImage(imageBaseURL + "w780" + movie.backdropPath),
              image: NetworkImage("https://www.woolha.com/media/2020/10/flutter-using-textbutton-examples-1200x627.jpg"),
              fit: BoxFit.cover)
      ),
///*
      child: Container(
        height: 140,
        width: 210,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  //Colors.black.withOpacity(0.61),
                  //Colors.black.withOpacity(0)
                ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              //movie.title,
              "tatadsadknaoidija",
              style: TextStyle(color: Color(0xFF000000)),
              //style: whiteTextFont,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            //RatingStars(
              //voteAverage: movie.voteAverage,
            //)
          ],
        ),
      ),
// */
    );
  }
}
