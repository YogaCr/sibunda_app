class JawabanModel{
  String? jawaban;
  String? link;

  JawabanModel({this.jawaban, this.link});

  Map<String, dynamic> toMap(){
    return {
      'jawaban': jawaban,
      'link': link,
    };
  }
}