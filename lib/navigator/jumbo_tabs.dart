import 'package:flutter/widgets.dart';
import 'package:mp_antd_mobile/mp_antd_mobile.dart';
import 'package:mp_antd_mobile/navigator/common_tab_view.dart';

class AntJumboTabs extends StatelessWidget {
  final AntTabController? controller;
  final List<AntJumboTabItem> tabs;
  final bool tabBarScrollable;

  const AntJumboTabs({
    Key? key,
    required this.tabs,
    this.controller,
    this.tabBarScrollable = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AntTabView(
      tabLocation: AntTabLocation.top,
      tabBarHeight: 66,
      tabBarDecoration: AntDivider(padding: EdgeInsets.zero),
      tabBarScrollable: tabBarScrollable,
      tabs: this.tabs.map((e) {
        return AntTabItem(
          activeTabWidget: (() {
            return AntJumboTabButton(item: e, actived: true);
          })(),
          inactiveTabWidget: (() {
            return AntJumboTabButton(item: e, actived: false);
          })(),
          builder: e.contentBuilder ??
              (context) {
                return Container();
              },
        );
      }).toList(),
      controller: controller,
      disabledPages: this.tabs.asMap().map((key, value) {
        return MapEntry(key, value.disabled);
      }),
    );
  }
}

class AntJumboTabItem extends StatelessWidget {
  final String title;
  final String description;
  final bool disabled;
  final WidgetBuilder? contentBuilder;

  const AntJumboTabItem(
      {Key? key,
      required this.title,
      required this.description,
      this.disabled = false,
      this.contentBuilder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class AntJumboTabButton extends StatelessWidget {
  final AntJumboTabItem item;
  final bool actived;

  const AntJumboTabButton({
    Key? key,
    required this.item,
    required this.actived,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = AntTheme.of(context) ?? AntTheme(primaryColor: Colors.blue);
    return Opacity(
      opacity: this.item.disabled ? 0.5 : 1.0,
      child: Padding(
        padding: EdgeInsets.only(left: 6, right: 6),
        child: Column(
          children: [
            Text(
              item.title,
              style: TextStyle(
                color: this.actived
                    ? theme.primaryColor
                    : theme.textTheme.mainTextColor,
                fontSize: theme.textTheme.fontSize.size9,
              ),
            ),
            Container(
              height: 18,
              padding: EdgeInsets.only(left: 6, right: 6),
              decoration: BoxDecoration(
                color: this.actived ? theme.primaryColor : theme.boxColor,
                borderRadius: BorderRadius.circular(999),
              ),
              child: Center(
                child: Text(
                  this.item.description,
                  style: TextStyle(
                    color: this.actived
                        ? Colors.white
                        : theme.textTheme.weakTextColor,
                    fontSize: theme.textTheme.fontSize.main,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
