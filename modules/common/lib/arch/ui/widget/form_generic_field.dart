import 'package:common/arch/ui/model/form_data.dart';
import 'package:common/arch/ui/widget/img_widget.dart';
import 'package:common/arch/ui/widget/txt_input.dart';
import 'package:common/res/string/_string.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:common/util/assets.dart';
import 'package:common/util/form_util.dart';
import 'package:common/util/times.dart';
import 'package:common/value/enums.dart';
import 'package:core/domain/model/wrapper.dart';
import 'package:core/ui/base/live_data.dart';
import 'package:core/ui/base/live_data_observer.dart';
import 'package:core/util/_consoles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'default_widget.dart';


abstract class SibFormField extends StatelessWidget {
  LiveData<dynamic> get responseLiveData;
  LiveData<bool>? get isValid;
}


class TxtField<D> extends SibFormField {
  final FormUiTxt itemData;
  @override
  final LiveData<bool>? isValid;
  final LiveData<bool>? isEnabledController;
  late final MutableLiveData<D> _response; //TODO: msh blum di dispose.
  final TextEditingController _textController = TextEditingController();
  @override
  LiveData<D> get responseLiveData => _response;
  final bool isLiveDataOwner;
  final RelativePosition imgPosition;

  /// This will become default invalid message.
  final String invalidMsg;
  final String? Function(String? response)? invalidMsgGenerator;
  final String Function(D? response)? getResponseRepresentation;
  final D? Function(String response)? rawResponseMapper;
  //final Future<D?> Function()? dataPicker;
  final Var<bool> isChanging = Var(false);
  final bool readOnly;
  /// If this is `false`, then this field is forced to be disabled,
  /// no matter what [isEnabledController.value] is `false` or `true`.
  final bool enabled;
  final Widget? suffixIcon;

  TxtField({
    required this.itemData,
    this.isValid,
    this.isEnabledController,
    this.invalidMsgGenerator,
    this.invalidMsg = Strings.field_can_not_be_empty,
    this.imgPosition = RelativePosition.below,
    this.readOnly = false,
    this.enabled = true,
    this.suffixIcon,
    //this.dataPicker,
    this.getResponseRepresentation,
    this.rawResponseMapper,
    bool? isLiveDataOwner,
    //TextEditingController? textController,
    MutableLiveData<D>? responseLiveData
  }): this.isLiveDataOwner = isLiveDataOwner ?? responseLiveData == null
  //  this.textController = textController ?? TextEditingController()
  {
    _response = responseLiveData ?? MutableLiveData();
/*
    ?? MutableChangeNotifLiveData(
      this._textController,
      getNotif: (notif) => this._textController.text,
      setNotif: (notif, data) {
        if(!isChanging.value) {
          isChanging.value = true;
          this._textController.text = getResponseRepresentation?.call(data) ?? data?.toString() ?? "";
          isChanging.value = false;
        }
      },
    );
 */
    _response.observeForever((data) {
      //prind("TxtField responseLiveData.observeForever hasCode= ${hashCode} isChanging = $isChanging data= $data data?.runtimeType = ${data?.runtimeType}");
      if(!isChanging.value) {
        isChanging.value = true;
        _textController.text = getResponseRepresentation?.call(data) ?? data?.toString() ?? "";
        isChanging.value = false;
      }
    });

    if(enabled && !readOnly) {
      _textController.addListener(() {
        if(_response.isActive) {
          //prind("TxtField this.textController.addListener isChanging = $isChanging");
          if(!isChanging.value) {
            //prind("TxtField this.textController.addListener txt = ${_textController.text}");
            isChanging.value = true;
            if(rawResponseMapper == null) {
              //prinw("`rawResponseMapper` == null and this `$runtimeType` is recording raw input from text. This `$runtimeType` is recording if only `D` is String.");
              if(D == String || D == dynamic){
                _response.value = _textController.text as D;
              } else {
                prinw("`rawResponseMapper` == null and `D` ($D) is not String. Raw response from text is ignored!");
              }
            } else {
              _response.value = rawResponseMapper?.call(_textController.text);
            }
            isChanging.value = false;
          }
        }
      });
    }

    if(responseLiveData?.value != null) {
      final data = responseLiveData!.value;
      _textController.text = getResponseRepresentation?.call(data) ?? data?.toString() ?? "";
    }
  }

  @override
  Widget build(BuildContext context) {
    final liveDataList = <LiveData<bool>>[];
    if(isValid != null) {
      liveDataList.add(isValid!);
    }
    if(isEnabledController != null) {
      liveDataList.add(isEnabledController!);
    }
    bool isInit = true;
    Widget? widget;
    if(isValid == null && isEnabledController == null) {
      widget =  TxtInput(
        readOnly: readOnly,
        suffixIcon: suffixIcon,
        textController: _textController,
        label: itemData.question,
      );
    } else if(isValid != null && isEnabledController != null) {
      widget = MultiLiveDataObserver<bool>(
        isLiveDataOwner: isLiveDataOwner,
        liveDataList: [isValid!, isEnabledController!],
        builder: (ctx, bools) {
          final txtWidget = TxtInput(
            enabled: enabled && bools[1] != false,
            readOnly: readOnly,
            suffixIcon: suffixIcon,
            textController: _textController,
            label: itemData.question,
            errorText: (bools[0] == false && !isInit)
                ? invalidMsgGenerator?.call(_textController.text) ?? invalidMsg
                : null,
          );
          if(bools[0] != null) { //if `isValid` still null, then this widget is still init (`isInit` == true)
            isInit = false;
          }
          return txtWidget;
        },
      );
    } else if(isValid != null) {
      widget = LiveDataObserver<bool>(
        isLiveDataOwner: isLiveDataOwner,
        liveData: isValid!,
        builder: (ctx, isValid) {
          final txtWidget = TxtInput(
            enabled: enabled,
            readOnly: readOnly,
            suffixIcon: suffixIcon,
            textController: _textController,
            label: itemData.question,
            errorText: (isValid == false && !isInit)
                ? invalidMsgGenerator?.call(_textController.text) ?? invalidMsg
                : null,
          );
          if(isValid != null) { //if `isValid` still null, then this widget is still init (`isInit` == true)
            isInit = false;
          }
          return txtWidget;
        },
      );
    } else if(isEnabledController != null){
      widget = LiveDataObserver<bool>(
        isLiveDataOwner: isLiveDataOwner,
        liveData: isEnabledController!,
        builder: (ctx, isEnabled) {
          final txtWidget = TxtInput(
            enabled: enabled && isEnabled != false,
            readOnly: readOnly,
            suffixIcon: suffixIcon,
            textController: _textController,
            label: itemData.question,
          );
          return txtWidget;
        },
      );
    }
/*
    final widget = isValid == null
        ? TxtInput(
          readOnly: readOnly,
          suffixIcon: suffixIcon,
          textController: _textController,
          label: itemData.question,
        ) : LiveDataObserver<bool>(
          isLiveDataOwner: isLiveDataOwner,
          liveDataList: liveDataList,
          builder: (ctx, isValid) {
            final txtWidget = TxtInput(
              enabled: enabled,
              readOnly: readOnly,
              suffixIcon: suffixIcon,
              textController: _textController,
              label: itemData.question,
              errorText: (isValid == false && !isInit)
                  ? invalidMsgGenerator?.call(_textController.text) ?? invalidMsg
                  : null,
            );
            if(isValid != null) { //if `isValid` still null, then this widget is still init (`isInit` == true)
              isInit = false;
            }
            return txtWidget;
          },
        );
 */

    if(isLiveDataOwner && itemData.answer != null) {
      _textController.text = itemData.answer!;
    }
    final colChildren = <Widget>[widget!,];
    if(itemData.img?.isNotEmpty == true) {
      if(imgPosition == RelativePosition.above) {
        for(final img in itemData.img!) {
          colChildren.insert(colChildren.length -1,
            SibImages.resolve(img),
          );
        }
      } else {
        for(final img in itemData.img!) {
          colChildren.add(
            SibImages.resolve(img),
          );
        }
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
  final LiveData<bool>? isEnabledController;
  final MutableLiveData<String> groupValueLiveData;
  @override
  LiveData<String> get responseLiveData => groupValueLiveData;
  final bool isLiveDataOwner;
  final RelativePosition imgPosition;

  /// If this is `false`, then this field is forced to be disabled,
  /// no matter what [isEnabledController.value] is `false` or `true`.
  final bool enabled;

  /// This will become default invalid message.
  final String invalidMsg;
  final String? Function(String? response)? invalidMsgGenerator;

  RadioGroup({
    required this.itemData,
    this.isValid,
    this.isEnabledController,
    this.invalidMsg = Strings.field_can_not_be_empty,
    this.imgPosition = RelativePosition.below,
    this.enabled = true,
    this.invalidMsgGenerator,
    MutableLiveData<String>? groupValueLiveData,
    bool? isLiveDataOwner,
  }):
    this.groupValueLiveData = groupValueLiveData ?? MutableLiveData(),
    this.isLiveDataOwner = isLiveDataOwner ?? groupValueLiveData == null
  {
    this.groupValueLiveData.observeForever((data) {
      prind("RadioGroup this.groupValueLiveData.observeForever data = $data");
    });
  }

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

    Widget? Function(BuildContext, String?) getBuilder(final String option) {
      //prind("RadioGroup getBuilder() isEnabledController == null => ${isEnabledController == null}");

      if(isEnabledController == null) {
         return (ctx, data) {
           prind("RadioGroup isEnabledController == null data= $data");
           return Radio<String>(
             value: option,
             groupValue: data,
             onChanged: enabled ? (value) => groupValueLiveData.value = value : null,
           );
         };
      } else {
        String? data2; // I don't know why but Dart seems unable to capture
          // parameter `data` new reference. So, the value of `data` stays the same like the old one.
        return (ctx, data) {
          //prind("RadioGroup isEnabledController != null data= $data");
          data2 = data;
          return LiveDataObserver<bool>(
            liveData: isEnabledController!,
            builder: (ctx, enabled) {
              //prind("RadioGroup isEnabledController != null INNER builder data= $data data2= $data2 enabled = $enabled");
              return Radio<String>(
                value: option,
                groupValue: data2, //If I use parameter `data` here, then the value won't change.
                    // although the outer lambda gets called whenever `groupValueLiveData.value` change
                    // and this inner lambda gets new parameter `data` with new value.
                    // It seems it has something to do with Flutter `State` class.
                onChanged: this.enabled && enabled != false
                    ? (value) {
                  //prind("RadioGroup onChange groupValueLiveData.value = ${groupValueLiveData.value} value = $value groupValue = $data option = $option this.enabled = ${this.enabled} enabled = $enabled");
                  groupValueLiveData.value = value;
                  //data = value;
                } : null,
              );
            },
          );
        };
      }
    }

    for(final option in itemData.answerItems) {
      optionWidgetList.add(
        Flexible(
          child: ListTile(
            title: Text(option),
            leading: LiveDataObserver<String>(
              isLiveDataOwner: isLiveDataOwner,
              liveData: groupValueLiveData,
              builder: getBuilder(option),
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

    if(itemData.img?.isNotEmpty == true) {
      final diff = imgPosition == RelativePosition.above ? 2 : 1;
      for(final img in itemData.img!) {
        outerColumChildren.insert(outerColumChildren.length - diff,
          SibImages.resolve(img),
        );
      }
    }

    //bool _isInit = true;
    if(isValid != null) {
      final index = imgPosition == RelativePosition.above
          ? outerColumChildren.length -1
          : 1;

      outerColumChildren.insert(index, Container(
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


class CheckGroup extends SibFormField {
  final FormUiCheck itemData;
  @override
  final LiveData<bool>? isValid;
  final LiveData<bool>? isEnabledController;
  final MutableLiveData<Set<int>> selectedIndicesLiveData;
  @override
  LiveData<Set<int>> get responseLiveData => selectedIndicesLiveData;
  final bool isLiveDataOwner;
  final RelativePosition imgPosition;

  /// If this is `false`, then this field is forced to be disabled,
  /// no matter what [isEnabledController.value] is `false` or `true`.
  final bool enabled;

  /// This will become default invalid message.
  final String invalidMsg;
  final String? Function(Set<int> responses)? invalidMsgGenerator;

  CheckGroup({
    required this.itemData,
    this.isValid,
    this.isEnabledController,
    this.invalidMsg = Strings.field_can_not_be_empty,
    this.imgPosition = RelativePosition.below,
    this.enabled = true,
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

    Widget? Function(BuildContext, Set<int>?) getBuilder(final int index) {
      if(isEnabledController == null) {
        return (ctx, data) => Checkbox(
          value: data?.contains(index) == true,
          onChanged: enabled && data != null ? (isSelected) {
            if(isSelected == true) {
              data.add(index);
            } else {
              data.remove(index);
            }
            selectedIndicesLiveData.notifyObservers();
          } : null,
        );
      } else {
        return (ctx, data) => LiveDataObserver<bool>(
          liveData: isEnabledController!,
          builder: (ctx, enabled) => Checkbox(
            value: selectedIndicesLiveData.value!.contains(index),
            onChanged: this.enabled && enabled != false && data != null ? (isSelected) {
              if(isSelected == true) {
                data.add(index);
              } else {
                data.remove(index);
              }
              selectedIndicesLiveData.notifyObservers();
            } : null,
          )
        );
      }
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
              builder: getBuilder(i2),
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

    if(itemData.img?.isNotEmpty == true) {
      final diff = imgPosition == RelativePosition.above ? 2 : 1;
      for(final img in itemData.img!) {
        outerColumChildren.insert(outerColumChildren.length - diff,
          SibImages.resolve(img),
        );
      }
    }

    if(isValid != null) {
      final index = imgPosition == RelativePosition.above
          ? outerColumChildren.length -1
          : 1;
      outerColumChildren.insert(index, Container(
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
