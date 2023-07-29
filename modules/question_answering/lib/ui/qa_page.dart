import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:common/arch/ui/page/secondary_frames.dart';
import 'package:flutter/cupertino.dart';
import 'package:question_answering/config/qa_routes.dart';

import 'package:question_answering/model/jawaban.dart';

class QuestionAnsweringPage extends StatelessWidget {
  const QuestionAnsweringPage({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return TopBarTitleAndBackFrame(
      title: 'Tanya Jawab',
      body: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _textController = TextEditingController();

  JawabanModel? jawaban=null;
  bool isLoading=false, isFirst=true;
  Future<void> sendQuestion() async {
    final url = Uri.parse("http://localhost:5421/qa");
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({'question': _textController.text});

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      jawaban = JawabanModel(jawaban:(jsonDecode(response.body)['answer'] +
          (jsonDecode(response.body)['path'] != ""
              ? ". Sebagai referensi anda dapat membaca artikel berikut : "
              : "")),link:jsonDecode(response.body)['path']);
      setState(() {
        isLoading=false;
      });
    } else {
      jawaban = JawabanModel(jawaban:"Terdapat masalah pada saat kami mencoba menjawab pertanyaan anda, silahkan coba lagi");
      setState(() {
        isLoading=false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Center(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Apa yang ingin anda tanyakan?",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            TextField(
              controller: _textController,
              textInputAction: TextInputAction.search,
              onSubmitted: (value) {
                setState((){
                  jawaban?.link = "";
                  isFirst=false;
                  isLoading=true;
                });
                sendQuestion();
              },
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                  ),
                  hintText: 'Masukkan pertanyaan anda'),
            ),
            Padding(padding: EdgeInsets.all(16.0), child: Text("Jawaban : ")),
            Padding(
                padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
                child: RichText(
                  text: TextSpan(
                    children:[
                      TextSpan(
                        text:(isFirst?"Harap masukkan pertanyaan terlebih dahulu":(isLoading?"Harap Tunggu":jawaban?.jawaban!)),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      if(!isFirst&&(jawaban?.link!=null&&jawaban?.link!=""))
                        TextSpan(
                            text: "Artikel",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                QaRoutes.artikelQaPage.goToPage(context, args: {
                                  'link':jawaban?.link
                                });
                              }
                        ),
                    ]
                  )
                )
            ),
          ],
        ),
      )),
    );
  }
}
