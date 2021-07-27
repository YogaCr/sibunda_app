import 'dart:io';

import 'package:common/arch/domain/dummy_data.dart';
import 'package:common/arch/domain/model/img_data.dart';
import 'package:common/arch/ui/model/form_data.dart';
import 'package:common/arch/ui/widget/_basic_widget.dart';
import 'package:common/arch/ui/widget/form_controller.dart';
import 'package:common/arch/ui/widget/img_widget.dart';
import 'package:common/arch/ui/widget/txt_input.dart';
import 'package:common/config/_config.dart';
import 'package:common/res/string/_string.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:common/util/assets.dart';
import 'package:common/util/form_util.dart';
import 'package:common/util/navigations.dart';
import 'package:common/util/times.dart';
import 'package:common/value/enums.dart';
import 'package:core/domain/model/wrapper.dart';
import 'package:core/ui/base/live_data.dart';
import 'package:core/ui/base/live_data_observer.dart';
import 'package:core/util/_consoles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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

  /// This is just for input. It means, if [_response.value] changes,
  /// [_controller] won't be notified.
  final FieldController<D>? _controller;
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

  final bool isTypePassword;

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
    this.isTypePassword = false,
    bool? isLiveDataOwner,
    //TextEditingController? textController,
    MutableLiveData<D>? responseLiveData,
    FieldController<D>? controller,
  }):
    this.isLiveDataOwner = isLiveDataOwner ?? responseLiveData == null,
    _controller = controller
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

    if(_controller != null) {
      _controller!.observe(_response, (data) {
        //if(!isChanging.value) {
          //isChanging.value = true;
          _response.value = data;
          //isChanging.value = false;
        //}
      });
    }

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
        isTypePassword: isTypePassword
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
              isTypePassword: isTypePassword
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
              isTypePassword: isTypePassword
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
            isTypePassword: isTypePassword
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

  /// This is just for input. It means, if [_response.value] changes,
  /// [_controller] won't be notified.
  final FieldController<String>? _controller;
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
    FieldController<String>? controller,
    bool? isLiveDataOwner,
  }):
    this.groupValueLiveData = groupValueLiveData ?? MutableLiveData(),
    this.isLiveDataOwner = isLiveDataOwner ?? groupValueLiveData == null,
    _controller = controller
  {
/*
    this.groupValueLiveData.observeForever((data) {
      prind("RadioGroup this.groupValueLiveData.observeForever data = $data");
    });
 */
    if(_controller != null) {
      _controller!.observe(this.groupValueLiveData, (data) {
        this.groupValueLiveData.value = data;
      });
    }
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

    Widget getLiveDataObserver(String option) {
      if(isEnabledController == null) {
        return LiveDataObserver<String>(
          liveData: groupValueLiveData,
          builder: (ctx, data) {
            prind("RadioGroup isEnabledController == null data= $data");
            return Radio<String>(
              value: option,
              groupValue: data,
              onChanged: enabled ? (value) => groupValueLiveData.value = value : null,
            );
          },
        );
      } else {
        String? groupVal2;
        return MultiLiveDataObserver<dynamic>(
          liveDataList: [groupValueLiveData, isEnabledController!],
          builder: (ctx, dataList) {
            final groupVal = dataList[0] as String?;
            final enabled = dataList[1] as bool?;
            groupVal2 = groupVal;
            prind("RadioGroup groupVal= $groupVal groupVal2 = $groupVal2 enabled= $enabled");
            return Radio<String>(
              value: option,
              groupValue: groupVal2, //If I use parameter `data` here, then the value won't change.
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
      }
    }

    /*
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
          data2 = data;
          prind("RadioGroup isEnabledController != null data= $data data2= $data2");
          return LiveDataObserver<bool>(
            liveData: isEnabledController!,
            builder: (ctx, enabled) {
              prind("RadioGroup isEnabledController != null INNER builder data= $data data2= $data2 enabled = $enabled");
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
     */

    for(final option in itemData.answerItems) {
      optionWidgetList.add(
        Flexible(
          child: ListTile(
            title: Text(option),
            leading: getLiveDataObserver(option),
/*
            LiveDataObserver<String>(
              isLiveDataOwner: isLiveDataOwner,
              liveData: groupValueLiveData,
              builder: getBuilder(option),
            ),
 */
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

  /// This is just for input. It means, if [_response.value] changes,
  /// [_controller] won't be notified.
  final FieldController<Set<int>>? _controller;

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
    FieldController<Set<int>>? controller,
    bool? isLiveDataOwner,
  }):
    this.selectedIndicesLiveData = selectedIndicesLiveData ?? MutableLiveData(),
    this.isLiveDataOwner = isLiveDataOwner ?? selectedIndicesLiveData == null,
    _controller = controller
  {
    if(_controller != null) {
      _controller!.observe(this.selectedIndicesLiveData, (data) {
        this.selectedIndicesLiveData.value = data;
      });
    }
  }

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


class ImgPickerField extends SibFormField {
  final FormUiImgPicker itemData;
  @override
  final LiveData<bool>? isValid;
  final LiveData<bool>? isEnabledController;
  final picker = ImagePicker();

  /// If this is `false`, then this field is forced to be disabled,
  /// no matter what [isEnabledController.value] is `false` or `true`.
  final bool enabled;

  final bool isLiveDataOwner;

  @override
  LiveData<ImgData> get responseLiveData => imgController;
  final MutableLiveData<ImgData> imgController;

  /// This will become default invalid message.
  final String invalidMsg;
  final String? Function(ImgData? responses)? invalidMsgGenerator;

  ImgPickerField({
    required this.itemData,
    this.isValid,
    this.isEnabledController,
    this.enabled = true,
    this.invalidMsg = Strings.field_can_not_be_empty,
    this.invalidMsgGenerator,
    bool? isLiveDataOwner,
    MutableLiveData<ImgData>? imgController,
  }):
    imgController = imgController ?? MutableLiveData(),
    isLiveDataOwner = isLiveDataOwner ?? imgController == null
  ;

  @override
  Widget build(BuildContext context) {
    final title = Text(
      itemData.question,
    );
    final img = LiveDataObserver<ImgData>(
      liveData: imgController,
      isLiveDataOwner: isLiveDataOwner,
      builder: (ctx, data) => Stack(
        children: [
          Container(
            constraints: BoxConstraints(
              maxHeight: 100,
              maxWidth: 180,
            ),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: black_trans_most2,
                  blurRadius: 5,
                  offset: Offset(5,5,),
                ),
              ]
            ),
            child: SibImages.resolve(
              data ?? imgPlaceholder,
              fit: data != null ? BoxFit.cover : BoxFit.contain,
            ),
          ),
          data != null ? Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  showDialog(
                    context: ctx,
                    builder: (ctx) => GestureDetector(
                      onTap: () => backPage(ctx),
                      child: Container(
                        color: black_trans_most,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(50),
                              child: InteractiveViewer(
                                child: SibImages.resolve(
                                  data,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                margin: EdgeInsets.all(15),
                                child: Icon(
                                  Icons.clear_rounded,
                                  size: 35,
                                  color: red,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ) : defaultEmptyWidget(),
        ],
      ),
    );
    final iconSize = 30.0;
    final btnPicker = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        /*
        Text(
          Strings.pick_img,
          style: SibTextStyles.size_min_1_colorPrimary,
        ),
        SizedBox(width: 12,),
         */
        ActionChip(
          labelPadding: EdgeInsets.symmetric(
            horizontal: 5,
            vertical: 10,
          ),
          backgroundColor: Manifest.theme.colorPrimary,
          avatar: Icon(
            Icons.add_photo_alternate_outlined,
            size: iconSize,
            color: white,
          ),
          label: Text(
            Strings.pick_img_gallery,
            style: TextStyle(color: white),
          ),
          onPressed: () async {
            final res = await picker.pickImage(source: ImageSource.gallery);
            imgController.value = res != null
                ? ImgData(link: res.path, src: ImgSrc.file)
                : null;
          },
        ),
        //SizedBox(width: 15,),
        ActionChip(
          labelPadding: EdgeInsets.symmetric(
            horizontal: 5,
            vertical: 10,
          ),
          backgroundColor: Manifest.theme.colorPrimary,
          avatar: Icon(
            Icons.add_a_photo_outlined,
            size: iconSize,
            color: white,
          ),
          label: Text(
            Strings.pick_img_camera,
            style: TextStyle(color: white),
          ),
          onPressed: () async {
            final res = await picker.pickImage(source: ImageSource.camera);
            imgController.value = res != null
                ? ImgData(link: res.path, src: ImgSrc.file)
                : null;
          },
        ),
      ],
    );
    final btnPickerWrapper = isEnabledController != null ? LiveDataObserver<bool>(
      liveData: isEnabledController!,
      builder: (ctx, enabled) => this.enabled && enabled == true
          ? btnPicker : defaultEmptyWidget(),
    ) : enabled
        ? btnPicker : defaultEmptyWidget();

    final children = <Widget>[
      title,
      SizedBox(height: 10,),
      Center(child: img,), //2
      SizedBox(height: 10,),
      Center(child: btnPickerWrapper,), //4
    ];

    if(isValid != null) {
      children.insert(4, Container(
        margin: EdgeInsets.only(bottom: 10,),
        child: LiveDataObserver<bool>(
          liveData: isValid!,
          builder: (ctx, isValid) => isValid == false
              ? Center(
            child: Text( invalidMsgGenerator?.call(imgController.value) ?? invalidMsg,
              style: SibTextStyles.size_min_2.copyWith(color: red),
            ),
          ) : SizedBox(),
        ),
      ));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: children,
    );
  }
}