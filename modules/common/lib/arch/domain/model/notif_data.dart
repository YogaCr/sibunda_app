
import 'package:common/arch/data/remote/model/home_notif_api_model.dart';
import 'package:common/arch/domain/dummy_data.dart';
import 'package:common/arch/domain/model/img_data.dart';
import 'package:common/util/type_util.dart';

class HomeNotifMsg {
  final String title;
  final String desc;
  final DateTime time;
  final ImgData img;
  final String? link;

  HomeNotifMsg({
    required this.title,
    required this.desc,
    required this.time,
    required this.img,
    this.link,
  });

  factory HomeNotifMsg.fromResponse(HomeNotifMsgDataResponse response) => HomeNotifMsg(
    title: response.title,
    desc: response.desc,
    time: parseDate(response.created_at),
    img: response.img_url != null
        ? ImgData(link: response.img_url!, src: ImgSrc.network,)
        : dummyImg,
    link: response.url,
  );
}