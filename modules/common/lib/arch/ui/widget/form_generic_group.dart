import 'package:common/arch/domain/model/form_data.dart';
import 'package:common/arch/ui/model/form_data.dart';
import 'package:common/arch/ui/vm/form_vm.dart';
import 'package:common/arch/ui/vm/form_vm_group.dart';
import 'package:common/config/manifest.dart';
import 'package:common/res/string/_string.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:common/util/form_util.dart';
import 'package:common/util/times.dart';
import 'package:common/util/ui.dart';
import 'package:common/value/enums.dart';
import 'package:core/ui/base/expirable.dart';
import 'package:core/ui/base/live_data.dart';
import 'package:core/util/_consoles.dart';
import 'package:core/val/strings.dart';
import 'package:flutter/material.dart';

import 'form_generic_field.dart';

/// A group that consists of some [FormData] and a header.
class FormGenericGroup extends StatefulWidget {
  final FormUiGroupData groupData;
  /// We assume that this [vm] is already ready when programmer build this [FormGenericGroup] widget.
  final FormVmGroupMixin vm;
  final int groupPosition;
  final RelativePosition imgPosition;
  final bool showHeader;
  final Widget? Function(int group, String key, MutableLiveData data)? pickerIconBuilder;
  //final String Function(int group, String key, dynamic data)? pickedDataRepresentator;

  FormGenericGroup({
    required this.groupData,
    required this.vm,
    required this.groupPosition,
    this.imgPosition = RelativePosition.below,
    this.showHeader = true,
    this.pickerIconBuilder,
    //this.pickedDataRepresentator,
  });

  @override
  _FormGenericGroupState createState() => _FormGenericGroupState(
    groupData: groupData,
    vm: vm,
    groupPosition: groupPosition,
    imgPosition: imgPosition,
    showHeader: showHeader,
    pickerIconBuilder: pickerIconBuilder,
    //pickedDataRepresentator: pickedDataRepresentator,
  );
}


class _FormGenericGroupState
    extends State<FormGenericGroup>
    implements Expirable
{
  final FormUiGroupData groupData;
  final FormVmGroupMixin vm;
  final int groupPosition;
  final RelativePosition imgPosition;
  final bool showHeader;
  //final Future<dynamic> Function(int group, String key)? dataPicker;
  final Widget? Function(int group, String key, MutableLiveData data)? pickerIconBuilder;
  //final String Function(int group, String key, dynamic data)? pickedDataRepresentator;

  /// Its keys are keys of [FormGenericVm.keyLabelList].
  final Map<String, MutableLiveData> itemLiveData = {};

  _FormGenericGroupState({
    required this.groupData,
    required this.vm,
    required this.groupPosition,
    required this.imgPosition,
    required this.showHeader,
    //required this.dataPicker,
    required this.pickerIconBuilder,
    //required this.pickedDataRepresentator,
  });

  @override
  Widget build(BuildContext context) {
    final groupRespMap = vm.responseGroupList[groupPosition];

    final formWidgets = List<Widget>.generate(
      groupData.data.length,
          (i) {
        final key = groupData.data[i].key;
        Widget field;
        //Widget Function(BuildContext, bool?)? fieldBuilder_old;
        final itemData = groupData.data[i];
        final vmLiveData = vm.responseGroupList[groupPosition][key]!.response as MutableLiveData; //TODO: probably risky operation.

        switch(itemData.type) {
          case FormType.text:
            //final txtLiveData = MutableLiveData<String>();
            //itemLiveData[key] = txtLiveData;

            Widget? suffixIcon;
            String Function(dynamic)? responseRepresentator;

            switch(itemData.input) {
              case FieldInputMethod.pickDate:
                final dateNow = DateTime.now();
                suffixIcon = InkWell(
                  onTap: () async {
                    final pickedDate = await showDatePicker(
                      context: context,
                      initialDate: dateNow,
                      firstDate: dateNow.subtract(Duration(days: 356)),
                      lastDate: dateNow.add(Duration(days: 356)),
                    );
                    //prind("onTap pickedDate = $pickedDate LUAR");
                    vmLiveData.value = pickedDate;
                  },
                  child: Icon(Icons.calendar_today),
                );
                responseRepresentator = (resp) => getTextForTextController(resp);
                break;
              case FieldInputMethod.pick:
                suffixIcon = pickerIconBuilder?.call(groupPosition, key, vmLiveData) ?? InkWell(
                  onTap: () {
                    showSnackBar(context, CoreStrings.pick_not_available);
                  },
                  child: Container(color: Manifest.theme.colorPrimary,),
                );
                responseRepresentator = (resp) => vm.getResponseStringRepr(groupPosition, key, resp);
                break;
              default:
                //suffixIcon = pickerIconBuilder?.call(groupPosition, key, vmLiveData); //TODO: for now, the direct input method can only be input by texting directly.
            }

            field = TxtField(
              itemData: itemData as FormUiTxt,
              isValid: groupRespMap[key]!.isValid,
              invalidMsgGenerator: (response) => vm.getInvalidMsg(key, vmLiveData.value),
              responseLiveData: vmLiveData, //txtLiveData,
              imgPosition: imgPosition,
              suffixIcon: suffixIcon,
              readOnly: itemData.input != FieldInputMethod.direct,
              getResponseRepresentation: responseRepresentator,
            );
/*
            txtControl = (field as TxtField).textController;
            final txtIsChanging = field.isChanging;
            vmLiveData.observe(this, (data) {
              prind("_FormGenericGroupState txtLiveData.observe data = $data txtIsChanging.value = ${txtIsChanging.value} LUAR");
              if(!txtIsChanging.value) {
                txtIsChanging.value = true;
                prind("_FormGenericGroupState txtLiveData.observe data = $data data?.runtimeType= ${data?.runtimeType}");
                //txtControl!.text = data ?? "";
                setTextForTextController(
                  txtControl!, data,
                  afterChanged: () async => txtIsChanging.value = false,
                );
              }
            });

            vm.registerField(
              groupPosition: groupPosition,
              inputKey: key,
              field: field,
            );
 */

            final answer = itemData.answer;
            if(answer != null) {
              //txtControl.text = answer;
              vmLiveData.value = answer;
            }
/*
            if(vmLiveData.value != null) { //vmLiveData.value?.isNotEmpty == true
              setTextForTextController(
                txtControl, vmLiveData.value,
              );
              //txtControl.text = vmLiveData.value;
            }
 */
            break;
          case FormType.radio:
          //final isValid = vm.isResponseValidList[i];
            final groupValue = MutableLiveData<String>();
            itemLiveData[key] = groupValue;

            field = RadioGroup(
              itemData: itemData as FormUiRadio,
              isValid: groupRespMap[key]!.isValid,
              invalidMsgGenerator: (response) => vm.getInvalidMsg(key, groupValue.value),
              groupValueLiveData: groupValue,
              imgPosition: imgPosition,
            );

            vmLiveData.observe(this, (data) {
              groupValue.value = data;
            });

            vm.registerField(
              groupPosition: groupPosition,
              inputKey: key,
              field: field as SibFormField,
            );

            final selectedAnswerIndex = itemData.selectedAnswer;
            if(selectedAnswerIndex != null) {
              groupValue.value = itemData.answerItems[selectedAnswerIndex];
            }
            if(vmLiveData.value?.isNotEmpty == true) {
              groupValue.value = vmLiveData.value;
            }
            break;
          case FormType.check:
            final selectedAnswerIndices = MutableLiveData<Set<int>>({});
            itemLiveData[key] = selectedAnswerIndices;

            field = CheckGroup(
              itemData: itemData as FormUiCheck,
              isValid: groupRespMap[key]!.isValid,
              invalidMsgGenerator: (response) => vm.getInvalidMsg(key, selectedAnswerIndices.value),
              selectedIndicesLiveData: selectedAnswerIndices,
              imgPosition: imgPosition,
            );

            vmLiveData.observe(this, (data) {
              selectedAnswerIndices.value = data;
            });

            vm.registerField(
              groupPosition: groupPosition,
              inputKey: key,
              field: field as SibFormField,
            );
            final selectedAnswers = itemData.selectedAnswers;

            if(selectedAnswers.isNotEmpty) {
              selectedAnswerIndices.value = selectedAnswers;
            }
            if(vmLiveData.value?.isNotEmpty == true) {
              selectedAnswerIndices.value = vmLiveData.value;
            }
            break;
        }

        return Container(
          margin: EdgeInsets.all(10),
          child: field,
        );
      },
    );

    if(showHeader) {
      formWidgets.insert(0,
        Container(
          margin: EdgeInsets.only(top: 20, bottom: 5),
          child: Text(
            groupData.header,
            style: SibTextStyles.size_0_bold,
          ),
        ),
      );
    }

    return Column(
      children: formWidgets,
    );
  }

  bool _isActive = true;
  @override
  bool get isActive => _isActive;

  @override
  void dispose() {
    _isActive = false;
    for(final ld in itemLiveData.values) {
      ld.dispose();
    }
    super.dispose();
  }
}