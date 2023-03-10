import 'package:flutter/widgets.dart';
import 'package:mp_antd_mobile/mp_antd_mobile.dart';
import 'package:mp_antd_mobile/navigator/common_tab_view.dart';

class AntCapsuleTabs extends StatelessWidget {
  final AntTabController? controller;
  final List<AntCapsuleTabItem> tabs;
  final bool tabBarScrollable;

  const AntCapsuleTabs({
    Key? key,
    required this.tabs,
    this.controller,
    this.tabBarScrollable = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AntTabView(
      tabLocation: AntTabLocation.top,
      tabBarHeight: 62,
      tabBarDecoration: AntDivider(padding: EdgeInsets.zero),
      tabBarScrollable: tabBarScrollable,
      tabs: this.tabs.map((e) {
        return AntTabItem(
          activeTabWidget: (() {
            if (tabBarScrollable) {
              return AntCapsuleTabButton(item: e, actived: true);
            } else {
              return Flexible(
                flex: 1,
                child: AntCapsuleTabButton(item: e, actived: true),
              );
            }
          })(),
          inactiveTabWidget: (() {
            if (tabBarScrollable) {
              return AntCapsuleTabButton(item: e, actived: false);
            } else {
              return Flexible(
                flex: 1,
                child: AntCapsuleTabButton(item: e, actived: false),
              );
            }
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

class AntCapsuleTabItem extends StatelessWidget {
  final String title;
  final bool disabled;
  final WidgetBuilder? contentBuilder;

  const AntCapsuleTabItem(
      {Key? key,
      required this.title,
      this.disabled = false,
      this.contentBuilder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class AntCapsuleTabButton extends StatelessWidget {
  final AntCapsuleTabItem item;
  final bool actived;

  const AntCapsuleTabButton({
    Key? key,
    required this.item,
    required this.actived,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = AntTheme.of(context) ?? AntTheme(primaryColor: Colors.blue);
    return Opacity(
      opacity: this.item.disabled ? 0.5 : 1.0,
      child: Container(
        height: 38,
        margin: EdgeInsets.only(left: 6, right: 6),
        padding: EdgeInsets.only(left: 18, right: 18),
        decoration: BoxDecoration(
          color: this.actived ? theme.primaryColor : theme.boxColor,
          borderRadius: BorderRadius.circular(999),
        ),
        child: Center(
          child: Text(
            this.item.title,
            style: TextStyle(
              color:
                  this.actived ? Colors.white : theme.textTheme.mainTextColor,
              fontSize: theme.textTheme.fontSize.size7,
            ),
          ),
        ),
      ),
    );
  }
}
