import 'package:common/arch/ui/model/form_data.dart';
import 'package:common/arch/ui/widget/img_widget.dart';
import 'package:common/arch/ui/widget/txt_input.dart';
import 'package:common/res/string/_string.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:core/ui/base/live_data.dart';
import 'package:core/ui/base/live_data_observer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'default_widget.dart';


abstract class SibFormField extends StatelessWidget {
  LiveData<dynamic> get responseLiveData;
  LiveData<bool>? get isValid;
}


class TxtField extends SibFormField {
  final FormUiTxt itemData;
  @override
  final LiveData<bool>? isValid;
  late final LiveData<String> _response;
  final TextEditingController textController = TextEditingController();
  @override
  LiveData<String> get responseLiveData => _response;
  final bool isLiveDataOwner;

  /// This will become default invalid message.
  final String invalidMsg;
  final String? Function(String? response)? invalidMsgGenerator;

  TxtField({
    required this.itemData,
    this.isValid,
    this.invalidMsgGenerator,
    this.invalidMsg = Strings.field_can_not_be_empty,
    bool? isLiveDataOwner,
    //TextEditingController? textController,
    MutableLiveData<String>? responseLiveData
  }): this.isLiveDataOwner = isLiveDataOwner ?? responseLiveData != null
  //  this.textController = textController ?? TextEditingController()
  {
    _response = responseLiveData ?? ChangeNotifLiveData(
      this.textController,
      (notif) => this.textController.text,
    );
    if(responseLiveData != null) {
      this.textController.addListener(() {
        if(responseLiveData.isActive) {
          responseLiveData.value = this.textController.text;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isInit = true;
    final widget = isValid == null
        ? TxtInput(
          textController: textController,
          label: itemData.question,
        ) : LiveDataObserver<bool>(
          isLiveDataOwner: isLiveDataOwner,
          liveData: isValid!,
          builder: (ctx, isValid) {
            //print("TxtField.builder isValid= $isValid isInit= $isInit");
            final txtWidget = TxtInput(
              textController: textController,
              label: itemData.question,
              errorText: (isValid == false && !isInit)
                  ? invalidMsgGenerator?.call(textController.text) ?? invalidMsg
                  : null,
            );
            if(isValid != null) { //if `isValid` still null, then this widget is still init (`isInit` == true)
              isInit = false;
            }
            return txtWidget;
          },
        );

    if(isLiveDataOwner && itemData.answer != null) {
      textController.text = itemData.answer!;
    }
    final colChildren = <Widget>[widget,];
    if(itemData.imgLink?.isNotEmpty == true) {
      for(final link in itemData.imgLink!) {
        colChildren.add(
          defaultFormItemImg(link),
        );
      }
    }
    return Column(
      children: colChildren,
    );
  }
}

class RadioGroup extends SibFormField {
  final FormUiRadio itemData;
  @override
  final LiveData<bool>? isValid;
  final MutableLiveData<String> groupValueLiveData;
  @override
  LiveData<String> get responseLiveData => groupValueLiveData;
  final bool isLiveDataOwner;

  /// This will become default invalid message.
  final String invalidMsg;
  final String? Function(String? response)? invalidMsgGenerator;

  RadioGroup({
    required this.itemData,
    this.isValid,
    this.invalidMsg = Strings.field_can_not_be_empty,
    this.invalidMsgGenerator,
    MutableLiveData<String>? groupValueLiveData,
    bool? isLiveDataOwner,
  }):
    this.groupValueLiveData = groupValueLiveData ?? MutableLiveData(),
    this.isLiveDataOwner = isLiveDataOwner ?? groupValueLiveData == null
  ;

  @override
  Widget build(BuildContext context) {
    final optionWidgetList = <Widget>[];

    if(isLiveDataOwner) {
      final selectedAnswerIndex = itemData.selectedAnswer;
      final selectedAnswer = selectedAnswerIndex != null
          ? itemData.answerItems[selectedAnswerIndex]
          : null;
      groupValueLiveData.value = selectedAnswer;
    }

    for(final option in itemData.answerItems) {
      optionWidgetList.add(
        Flexible(
          child: ListTile(
            title: Text(option),
            leading: LiveDataObserver<String>(
              isLiveDataOwner: isLiveDataOwner,
              liveData: groupValueLiveData,
              builder: (ctx, data) => Radio<String>(
                value: option,
                groupValue: data,
                onChanged: (value) => groupValueLiveData.value = value,
              ),
            ),
          ),
        ),
      );
    }

    final optionsWidget = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: optionWidgetList,
    );

    final outerColumChildren = <Widget>[
      Text(itemData.question),
      optionsWidget,
    ];

    if(itemData.imgLink?.isNotEmpty == true) {
      for(final link in itemData.imgLink!) {
        outerColumChildren.insert(outerColumChildren.length -1,
          defaultFormItemImg(link),
        );
      }
    }

    //bool _isInit = true;
    if(isValid != null) {
      outerColumChildren.insert(1, Container(
        margin: EdgeInsets.symmetric(vertical: 5,),
        child: LiveDataObserver<bool>(
          liveData: isValid!,
          builder: (ctx, isValid) => isValid == false
              ? Text( invalidMsgGenerator?.call(groupValueLiveData.value) ?? invalidMsg,
            style: SibTextStyles.size_min_2.copyWith(color: red),
          ) : SizedBox(),
        ),
      ));
    }

    return Column(
      children: outerColumChildren,
    );
  }
}

//TODO: lanjutkan
class CheckGroup extends SibFormField {
  final FormUiCheck itemData;
  @override
  final LiveData<bool>? isValid;
  final MutableLiveData<Set<int>> selectedIndicesLiveData;
  @override
  LiveData<Set<int>> get responseLiveData => selectedIndicesLiveData;
  final bool isLiveDataOwner;

  /// This will become default invalid message.
  final String invalidMsg;
  final String? Function(Set<int> responses)? invalidMsgGenerator;

  CheckGroup({
    required this.itemData,
    this.isValid,
    this.invalidMsg = Strings.field_can_not_be_empty,
    this.invalidMsgGenerator,
    MutableLiveData<Set<int>>? selectedIndicesLiveData,
    bool? isLiveDataOwner,
  }):
    this.selectedIndicesLiveData = selectedIndicesLiveData ?? MutableLiveData(),
    this.isLiveDataOwner = isLiveDataOwner ?? selectedIndicesLiveData == null
  ;

  @override
  Widget build(BuildContext context) {
    final optionWidgetList = <Widget>[];

    if(isLiveDataOwner) {
      final selectedAnswerIndices = itemData.selectedAnswers;
      selectedIndicesLiveData.value = selectedAnswerIndices;
    }

    for(int i = 0; i < itemData.answerItems.length; i++) {
      final i2 = i;
      final option = itemData.answerItems[i];
      optionWidgetList.add(
        Flexible(
          flex: 0,
          child: ListTile(
            title: Text(option),
            leading: LiveDataObserver<Set<int>>(
              isLiveDataOwner: isLiveDataOwner,
              liveData: selectedIndicesLiveData,
              builder: (ctx, data) => Checkbox(
                value: selectedIndicesLiveData.value!.contains(i2),
                onChanged: (isSelected) {
                  if(isSelected == true) {
                    selectedIndicesLiveData.value!.add(i2);
                  } else {
                    selectedIndicesLiveData.value!.remove(i2);
                  }
                  selectedIndicesLiveData.notifyObservers();
                },
              ),
            ),
          ),
        ),
      );
    }
///*
    final optionsWidget = Column(
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: optionWidgetList,
    );

    final outerColumChildren = <Widget>[
      Text(itemData.question),
      optionsWidget,
    ];
// */
/*
    final outerColumChildren = optionWidgetList;
    outerColumChildren.insert(0, Text(itemData.question));
 */

    if(itemData.imgLink?.isNotEmpty == true) {
      for(final link in itemData.imgLink!) {
        outerColumChildren.insert(outerColumChildren.length -1,
          defaultFormItemImg(link),
        );
      }
    }

    if(isValid != null) {
      outerColumChildren.insert(1, Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        child: LiveDataObserver<bool>(
          liveData: isValid!,
          builder: (ctx, isValid) => isValid == false
              ? Text( invalidMsgGenerator?.call(selectedIndicesLiveData.value!) ?? invalidMsg,
            style: SibTextStyles.size_min_2.copyWith(color: red),
          ) : SizedBox(),
        ),
      ));
    }

    return Column(
      children: outerColumChildren,
    );
  }
}
