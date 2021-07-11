import 'package:common/config/manifest.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:common/util/ui.dart';
import 'package:core/ui/base/expirable.dart';
import 'package:core/ui/base/live_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class TopBarItemCenterAlignList extends StatefulWidget {
  final PageController? pageController;
  final List<String> dataList;
  final void Function(int)? onItemClick;
  final double itemWidth;

  TopBarItemCenterAlignList({
    required this.dataList,
    this.pageController,
    this.onItemClick,
    this.itemWidth = 100,
  });

  @override
  _TopBarItemCenterAlignListState createState() => _TopBarItemCenterAlignListState(
    dataList: dataList,
    pageController: pageController,
    onItemClick: onItemClick,
    itemWidth: itemWidth,
  );
}

class _TopBarItemCenterAlignListState
    extends State<TopBarItemCenterAlignList>
    implements Expirable
{
  final PageController? pageController;
  final List<String> dataList;
  final void Function(int)? onItemClick;
  final double itemWidth;
  final ScrollController scrollController = ScrollController();
  final MutableLiveData<int> _globalSelectedPosition = MutableLiveData(-1);
  late double screenWidth;
  late double borderWidgetWidth;
  bool _isScrolling = false;

  _TopBarItemCenterAlignListState({
    required this.dataList,
    required this.itemWidth,
    this.pageController,
    this.onItemClick,
  }) {
    _globalSelectedPosition.observe(this, (selectedPos) {
      if(selectedPos != null && !_isScrolling) {
        _isScrolling = true;
        pageController?.animateToPage(selectedPos, duration: Duration(milliseconds: 1000), curve: Curves.fastOutSlowIn);
        onItemClick?.call(selectedPos);
        _scrollTo(selectedPos);
        _isScrolling = false;
      }
    }, distinctUntilChanged: true,);
    pageController?.addListener(() {
      if(isActive && !_isScrolling) {
        _isScrolling = true;
        final currentPage = pageController!.page;
        if(currentPage != null) {
          int currentPageInt;
          if(currentPage == (currentPageInt = currentPage.toInt())) {
            _globalSelectedPosition.value = currentPageInt;
            _scrollTo(currentPageInt);
          }
        }
        _isScrolling = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    screenWidth = screenSize.width;
    borderWidgetWidth = (screenWidth/2) - (itemWidth/2) - 5;

    final borderWidget = SizedBox(
      width: borderWidgetWidth,
    );

    final lastIndex = dataList.length +1;

    return ListView.builder(
      //physics: NeverScrollableScrollPhysics(),
      controller: scrollController,
      scrollDirection: Axis.horizontal,
      itemCount: dataList.length +2,
      itemBuilder: (ctx, i) => i == 0 || i == lastIndex
          ? borderWidget
          :  _Item(
              globalSelectedPosition: _globalSelectedPosition,
              text: dataList[i-1],
              position: i-1,
              screenWidth: screenWidth,
              itemWidth: itemWidth,
           ),
    );
  }

  void _scrollTo(int selectedPos) {
    scrollController.animateTo(
      ((itemWidth + 10.0) * selectedPos) - (screenWidth/2) + (itemWidth/2) + borderWidgetWidth,
      duration: Duration(milliseconds: 1200,),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  void dispose() {
    _isActive = false;
    scrollController.dispose();
    super.dispose();
  }

  bool _isActive = true;
  @override
  bool get isActive => _isActive;
}

class _Item extends StatefulWidget {
  final double screenWidth;
  final MutableLiveData<int> globalSelectedPosition;
  final String text;
  final int position;
  final double itemWidth;
  //final GlobalKey key;
  double? width;

  _Item({
    required this.globalSelectedPosition,
    required this.text,
    required this.position,
    required this.screenWidth,
    required this.itemWidth,
  }); //: this.key = key ?? GlobalKey(debugLabel: "Item of '$text' in position $position");

  @override
  State<StatefulWidget> createState() => _ItemState(
    globalSelectedPosition: globalSelectedPosition,
    text: text,
    position: position,
    screenWidth: screenWidth,
    itemWidth: itemWidth,
  );
}
class _ItemState extends State<_Item> implements Expirable {
  final double screenWidth;
  final MutableLiveData<int> globalSelectedPosition;
  final String text;
  final int position;
  final double itemWidth;
  //final GlobalKey key;
  //double? width;

  _ItemState({
    required this.globalSelectedPosition,
    required this.text,
    required this.position,
    required this.screenWidth,
    required this.itemWidth,
  }) /*: this.key = key ?? GlobalKey(debugLabel: "Item of '$text' in position $position")*/ {
    globalSelectedPosition.observe(this, (selectedPos) {
      setState(() {});
    }, distinctUntilChanged: true,);
  }

  @override
  Widget build(BuildContext context) {
/*
    if(position == 0) {
      WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
        print("_TopBarItemCenterAlignListState.build() timeStamp= $timeStamp isActive= $isActive");
        if(isActive) _scrollTo(0);
      });
    }

 */

    return GestureDetector(
      onTap: () {
        final prevPos = globalSelectedPosition.value!;
        if(prevPos == position) return;
        globalSelectedPosition.value = position;
        //print("Dipencet i = $position");
      },
      child: Container(
        width: itemWidth,
        height: 40,
        //key: key,
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: globalSelectedPosition.value == position ? Manifest.theme.primaryHighlightColor : null,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: SibTextStyles.size_min_1_colorOnPrimary,
        ),
      ),
    );
  }

  bool _isActive = true;
  @override
  bool get isActive => _isActive;

  @override
  void dispose() {
    _isActive = false;
    super.dispose();
  }
}