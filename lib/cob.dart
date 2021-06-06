import 'package:common/util/functions/ui_ext.dart';
import 'package:flutter/material.dart';

class CobPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) => Column(
    children: [
      Container(
        height: 100,
        width: double.infinity,
        color: Colors.blue,
      ),
      Expanded(
        //height: 500,
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (c, i) => Container(
                  height: 20,
                  width: 20,
                  color: (i % 2 == 0) ? Colors.red : Colors.green,
                  child: Text("Halo $i"),
                ),
                childCount: 30,
              ),
            ),
            SliverGrid.count(
              crossAxisCount: 3,
              children: List.generate(20, (i) => Container(
                height: 20,
                width: 20,
                color: (i % 2 == 0) ? Colors.red : Colors.green,
                child: Text("Hola $i"),
              ),),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget createCustomBottomNavBarGroup(BuildContext context) => Stack(
  children: [
    createCustomBottomNavBar(context),
    Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 46,
        width: 46,
        margin: EdgeInsets.only(bottom: 42),
        child: FloatingActionButton(
            elevation: 0,
            backgroundColor: Colors.green,
            child: SizedBox( // It doesn't matter this widget ???
              height: 26,
              width: 26,
              child: Icon(
                Icons.call,
                color: Colors.black.withOpacity(0.54),
              ),
            ),
            onPressed: () {
              //showSnackBar(context, "Halo sis");
              showDialog(context: context, builder: (ctx) => AlertDialog(
                title: Text("Halo bos"),
                content: Text("Ini kontennya"),
              ));
            }),
      ),
    )
  ],
);

Widget createCustomBottomNavBar(BuildContext ctx) => Align(
  alignment: Alignment.bottomCenter,
  child: ClipPath(
    clipper: BottomNavBarClipper(),
    child: Container(
      height: 70,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20))),
      child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          selectedItemColor: Colors.green,
          unselectedItemColor: Color(0xFFE5E5E5),
          currentIndex: 0,
          onTap: (index) {
            showSnackBar(ctx, "halo bro");
            /*
            setState(() {
              bottomNavBarIndex = index;
              pageController.jumpToPage(index);
            });
             */
          },
          items: [
            BottomNavigationBarItem(
                title: Text("New Movies",
/*
                    style: GoogleFonts.raleway(
                        fontSize: 13, fontWeight: FontWeight.w600)
 */
                        ),
                icon: Container(
                  margin: EdgeInsets.only(bottom: 6),
                  height: 20,
/*
                  child: Image.asset((bottomNavBarIndex == 0)
                      ? "assets/ic_movie.png"
                      : "assets/ic_movie_grey.png"),
 */
                )),
            BottomNavigationBarItem(
                title: Text("My Tickets",
/*
                    style: GoogleFonts.raleway(
                        fontSize: 13, fontWeight: FontWeight.w600)
 */
                ),
                icon: Container(
                  margin: EdgeInsets.only(bottom: 6),
                  height: 20,
/*
                  child: Image.asset((bottomNavBarIndex == 1)
                      ? "assets/ic_tickets.png"
                      : "assets/ic_tickets_grey.png"),
 */
                ))
          ]),
    ),
  ),
);


class BottomNavBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(size.width / 2 - 28, 0);
    path.quadraticBezierTo(size.width / 2 - 28, 33, size.width / 2, 33);
    path.quadraticBezierTo(size.width / 2 + 28, 33, size.width / 2 + 28, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}


class FormPage extends StatelessWidget {
  final GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final inputs = List<Widget>.generate(15, (index) =>
        Container(
          margin: EdgeInsets.all(20),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: "ahlo $index",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                borderSide: BorderSide(width: 100),
              ),
            ),
            validator: (txt) {
              return (txt == null || txt.isEmpty) ? "oy" : null;
            },
          ),
        ),
    );
    inputs.add(
      ElevatedButton(
        onPressed: () {
          if(_key.currentState!.validate()) showSnackBar(context, "Valid!", backgroundColor: Colors.green);
          else showSnackBar(context, "Gak Valid");
        },
        child: Text("Kirim"),
      ),
    );
    return Form(
      key: _key,
      child: Column(
        children: inputs,
      ).insideScroll(),
    );
  }
}