import 'package:common/arch/domain/model/img_data.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'form_warning_status.dart';

class ChartData {
  final String title;
  final List<LineSeries<dynamic, num>> seriesList;
  final List<FormWarningStatus> warningList;

  ChartData({
    required this.title,
    required this.seriesList,
    required this.warningList,
  });
}

class ChartMenuData {
  final String title;
  final ImgData img;

  ChartMenuData({
    required this.title,
    required this.img,
  });
}


class Charts {
  static final palette = List<Color>.unmodifiable([
    Color.fromRGBO(118, 154, 186, 1.0),
    Color.fromRGBO(174, 108, 192, 1.0),
    Color.fromRGBO(24, 100, 94, 1.0),
    Color.fromRGBO(255, 240, 54, 1.0),
    Color.fromRGBO(116, 180, 155, 1),
    Color.fromRGBO(0, 168, 181, 1),
    Color.fromRGBO(73, 76, 162, 1),
    Color.fromRGBO(234, 154, 69, 1.0),
    Color.fromRGBO(255, 240, 219, 1),
    Color.fromRGBO(250, 176, 176, 1.0)
  ]);
  static final dataLabelSetting = DataLabelSettings(
    //isVisible: true,
    showZeroValue: false,
  );

  /// In millis
  static final observedAnimDuration = comparedAnimDuration * 2.3;
  static final observedLineWidth = 3.0;
  static final observedLineColor = pink_300;
  static final observedMarker = MarkerSettings(
    isVisible: false,
    //borderWidth: 12,
  );

  /// In millis
  static final comparedAnimDuration = 2500.0;
  static final comparedLineWidth = 1.8;
  static final comparedMarker = MarkerSettings(
    isVisible: false,
    //borderWidth: 7,
  );

  static Color getLineColor(int i, {
    bool isObserved = false,
  }) {
    if(isObserved) {
      return observedLineColor;
    }
    return palette[i % palette.length].withOpacity(0.6);
  }

  static DataMarkerType getMarkerShape(int i) {
    final list = DataMarkerType.values;
    final marker = list[i % list.length];
    if(marker == DataMarkerType.none
        || marker == DataMarkerType.image) {
      return list[(i+1) % list.length];
    }
    return marker;
  }

  static MarkerSettings getMarkerSetting(int i, {
    bool isObserved = false,
  }) {
    final template = !isObserved ? comparedMarker : observedMarker;
    return MarkerSettings(
      isVisible: template.isVisible,
      borderWidth: template.borderWidth,
      shape: getMarkerShape(i),
    );
  }

  static double getChartLineWidth({
    required bool isObserved,
  }) => isObserved ? observedLineWidth : comparedLineWidth;

  static double getAnimDuration({
    required bool isObserved,
  }) => isObserved ? observedAnimDuration : comparedAnimDuration;


  static List<LineSeries<T, num>> getLineSeriesList<T>({
    required List<T> dataList,
    required List<String> labels,
    required List<num Function(T, int)> yGetters,
    required num Function(T, int) xGetter,
    int? observedIndex,
  }) {
    if(labels.length != yGetters.length) {
      throw "`labels.length` (${labels.length}) should be same as `getters.length` (${yGetters.length})";
    }

    //final lastComparedLimit = labels.length-1;
    final obsInd = observedIndex ?? labels.length-1;
    return List.generate(labels.length, (i) {
      final label = labels[i];
      //final key = keyList_sd[i];
      final getter = yGetters[i];
      final isObserved = i == obsInd;

      return LineSeries(
        dataLabelSettings: Charts.dataLabelSetting,
        markerSettings: Charts.getMarkerSetting(i, isObserved: isObserved),
        name: label,
        animationDuration: Charts.getAnimDuration(isObserved: isObserved),
        width: Charts.getChartLineWidth(isObserved: isObserved),
        color: getLineColor(i, isObserved: isObserved),
        dataSource: dataList,
        xValueMapper: xGetter,
        yValueMapper: getter,
      );
    });
  }
}