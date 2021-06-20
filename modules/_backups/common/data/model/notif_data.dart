
class HomeNotifMsg {
  final String title;
  final String desc;
  final String time;
  final String imgLink;
  final String? link;

  HomeNotifMsg({
    required this.title,
    required this.desc,
    required this.time,
    required this.imgLink,
    this.link,
  });
}