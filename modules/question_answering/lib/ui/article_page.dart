import 'dart:convert';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:common/arch/ui/page/secondary_frames.dart';

import 'package:http/http.dart' as http;

class MarkdownDisplayPage extends StatefulWidget {
  const MarkdownDisplayPage({Key? key}): super(key: key);

  @override
  State<MarkdownDisplayPage> createState() => _MarkdownDisplayPageState();
}

class _MarkdownDisplayPageState extends State<MarkdownDisplayPage> {

  var mdContent = "";
  var title="";
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      var path = (ModalRoute.of(context)!.settings.arguments?? <String, dynamic>{}) as Map;
      var splittedPath = path['link'].split('/');
      var titleString = splittedPath[splittedPath.length-1].replaceAll('-',' ').replaceAll('.md','');
      setState((){
        title = titleString.replaceFirst(titleString[0], titleString[0].toUpperCase());
      });
      getContent(path['link']);
    });
  }

  Future<void> getContent(String mdPath){
    var url = "http://127.0.0.1:5421/md?file_path=$mdPath";
    return http.get(Uri.parse(url)).then((response) {
      setState(() {
        mdContent = jsonDecode(response.body)["content"];
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    return TopBarTitleAndBackFrame(
      title: "Tanya Jawab",
      topBarChild: Padding(
        padding:EdgeInsets.only(bottom:24.0),
        child:Text(title, style: TextStyle(
            fontSize: 20.0,
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),
      )
    ),
      body: Scaffold(
        body:Stack(
          children: <Widget>[
            Expanded(
              child: Markdown(data:mdContent),
            ),
          ],
        ),
      )
    );
  }
}
