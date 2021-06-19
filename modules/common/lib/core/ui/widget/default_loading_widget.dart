import 'package:common/config/_config.dart';
import 'package:flutter/cupertino.dart';

class DefaultLoading extends StatelessWidget {

  @override
  Widget build(BuildContext context) => Container(
    height: 80,
    color: Manifest.theme.colorPrimary,
  );
}

Widget get defaultLoading => Container(
  height: 80,
  color: Manifest.theme.colorPrimary,
);

Widget get defaultSliverLoading => SliverToBoxAdapter(
  child: defaultLoading,
);