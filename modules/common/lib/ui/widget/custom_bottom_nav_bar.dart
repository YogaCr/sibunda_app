import 'package:common/config/_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MiddleBtnBottomNavBar extends StatelessWidget {
  final void Function(int)? onTap;
  final List<BottomNavigationBarItem> items;
  final Widget? midBtnChild;
  final void Function()? midBtnOnClick;

  MiddleBtnBottomNavBar({
    required this.midBtnChild,
    required this.items,
    this.onTap,
    this.midBtnOnClick,
  });

  @override
  Widget build(BuildContext context) {
    final primaryColor = Manifest.theme.colorPrimary;
    return Stack(
      children: [
        Align(
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
                selectedItemColor: primaryColor,
                unselectedItemColor: Color(0xFFE5E5E5),
                currentIndex: 0,
                onTap: onTap,
                items: items,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 46,
            width: 46,
            margin: EdgeInsets.only(bottom: 42),
            child: FloatingActionButton(
                elevation: 0,
                backgroundColor: Manifest.theme.colorPrimary,
                child: midBtnChild,
                onPressed: midBtnOnClick,
            ),
          )
        )
      ],
    );
  }
}


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