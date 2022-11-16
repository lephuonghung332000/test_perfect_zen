import 'package:flutter/material.dart';

import '../../../../guide.dart';

class ListGuideTheme extends StatelessWidget {
  final List<GuideThemeViewModel> items;
  final void Function(int)? onClickItem;
  final Key? keySecondItem;
  final ScrollPhysics scrollPhysics;

  const ListGuideTheme({
    Key? key,
    required this.items,
    this.onClickItem,
    this.keySecondItem,
    this.scrollPhysics = const BouncingScrollPhysics(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: scrollPhysics,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return GuideThemeItem(
          key: index == 1 ? keySecondItem : null,
          viewModel: items[index],
          onClickPlay: () {
            onClickItem?.call(index);
          },
        );
      },
      itemCount: items.length,
      separatorBuilder: (context, index) {
        return const SizedBox(height: 16);
      },
    );
  }
}
