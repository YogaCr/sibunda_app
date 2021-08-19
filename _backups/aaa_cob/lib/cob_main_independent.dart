import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

Future<void> _bgHandler(RemoteMessage event) async {
  print("message recieved in BG");
  print(event.notification!.body);
}

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  final res = await Firebase.initializeApp();
  print("res= $res");
  FirebaseMessaging.instance.getToken().then((str) {
    print("token = $str");
  });
  FirebaseMessaging.onMessage.listen((event) {
    print("message recieved");
    print(event.notification!.body);
  });
  FirebaseMessaging.onMessageOpenedApp.listen((event) {
    print("message recieved and CLICKED!!!");
    print(event.notification!.body);
  });
  FirebaseMessaging.onBackgroundMessage(_bgHandler);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: _PickImgGallery(),
      ),
    );
  }
}


class _PickImgGallery extends StatefulWidget {
  @override
  __PickImgGalleryState createState() => __PickImgGalleryState();
}

class __PickImgGalleryState extends State<_PickImgGallery> {
  File? imgFile;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        imgFile == null ? InkResponse(
          child: Icon(Icons.add_a_photo),
          onTap: () async {
            final res = await picker.pickImage(source: ImageSource.gallery);
            setState(() {
              imgFile = res == null ? null : File(res.path,);
            });
          },
        ) : Image.file(imgFile!),
        Visibility(
          visible: imgFile != null,
          child: Container(
            margin: EdgeInsets.only(top: 15),
            child: InkResponse(
              onTap: () => setState(() => imgFile = null),
              child: Icon(
                Icons.clear_rounded,
                color: Colors.red,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
