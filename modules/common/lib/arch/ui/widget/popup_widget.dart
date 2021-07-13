import 'package:common/arch/data/local/dao/data_dao.dart';
import 'package:common/arch/domain/model/_model_template.dart';
import 'package:common/arch/ui/adapter/id_string_adp.dart';
import 'package:common/arch/ui/widget/_basic_widget.dart';
import 'package:common/res/string/_string.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:common/util/navigations.dart';
import 'package:core/ui/base/live_data.dart';
import 'package:core/ui/base/live_data_observer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PopupSuccess extends StatelessWidget {
  final String msg;
  final String actionMsg;
  final void Function()? onActionClick;

  PopupSuccess({
    required this.msg,
    required this.actionMsg,
    this.onActionClick,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final width = screenSize.width * 85 / 100;
    final height = screenSize.height * 40 / 100;
    final iconSize = screenSize.width * 30 / 100;

    return SingleChildScrollView(
      child: Container(
        width: width,
        height: height,
        //constraints: BoxConstraints(minHeight: 400, minWidth: 200,),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: green_calm,
              ),
              child: Icon(
                Icons.check,
                size: iconSize,
                color: Colors.white,
              ),
            ),
            Text(
              msg,
              style: SibTextStyles.size_0,
              textAlign: TextAlign.center,
            ),
            TxtBtn(
              actionMsg,
              onTap: onActionClick,
            ),
          ],
        ),
      ),
    );
  }
}


class IdStringPopup extends StatelessWidget {
  final List<IdStringModel> dataList;
  final void Function(int id, String name)? onItemClick;

  IdStringPopup({
    required this.dataList,
    this.onItemClick,
  });

  @override
  Widget build(BuildContext context) {
    final txtControl = TextEditingController();
    return Column(
      children: [
        TxtInput(
          label: Strings.search,
          textController: txtControl,
        ),
        SizedBox(height: 15,),
        Expanded(
          child: IdStringListView(
            dataList: dataList,
            searchTxtControl: txtControl,
            onItemClick: onItemClick,
          ),
        ),
      ],
    );
  }
}

Future<IdStringModel?> showIdStringPopup({
  required BuildContext context,
  required List<IdStringModel> dataList,
}) => showDialog<IdStringModel>(
  context: context,
  builder: (ctx) => AlertDialog(
    content: IdStringPopup(
      dataList: dataList,
      onItemClick: (id, str) => backPage<IdStringModel>(
        ctx,
        result: IdStringModel(id: id, name: str),
      ),
    ),
  ),
);

Future<IdStringModel?> showLazyIdStringPopup({
  required BuildContext context,
  required Future<List<IdStringModel>> Function() dataSrc,
}) async {
  final isReady = MutableLiveData(false);

  List<IdStringModel>? dataList;
  dataSrc().then((data) {
    dataList = data;
    isReady.value = true;
  });

  return showDialog<IdStringModel>(
    context: context,
    builder: (ctx) => AlertDialog(
      content: LiveDataObserver<bool>(
        liveData: isReady,
        builder: (ctx, isReady) {
          final size = MediaQuery.of(ctx).size;
          final maxWidth = size.width *8 /10;
          final maxHeight = size.height *8 /10;
          return isReady == true ? Container(
            width: maxWidth,
            height: maxHeight,
/*
            constraints: BoxConstraints(
              maxHeight: maxHeight,
              maxWidth: maxWidth,
            ),
 */
            child: IdStringPopup(
              dataList: dataList!,
              onItemClick: (id, str) => backPage<IdStringModel>(
                ctx,
                result: IdStringModel(id: id, name: str),
              ),
            ),
          ) : defaultLoading(
            height: 100,
            width: 100,
          );
        },
      ),
    ),
  );
}


Future<IdStringModel?> showCitySelectionPopup({
  required BuildContext context,
  required CityDao dao,
}) => showLazyIdStringPopup(
  context: context,
  dataSrc: () async {
    final cities = await dao.get();
    final list = cities.map((e) => IdStringModel(id: e.id, name: e.name)).toList(growable: false);
    return list;
  },
);