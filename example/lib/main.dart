import 'package:flutter/widgets.dart';
import 'package:mp_antd_mobile/common/app.dart';
import 'package:mp_antd_mobile/common/theme.dart';
import 'package:mpcore/mpcore.dart';
import 'package:mpflutter_template/samples/auto_center.dart';
import 'package:mpflutter_template/samples/avatar.dart';
import 'package:mpflutter_template/samples/button.dart';
import 'package:mpflutter_template/samples/capsule_tabs.dart';
import 'package:mpflutter_template/samples/card.dart';
import 'package:mpflutter_template/samples/divider.dart';
import 'package:mpflutter_template/samples/home.dart';
import 'package:mpflutter_template/samples/jumbo_tabs.dart';
import 'package:mpflutter_template/samples/list.dart';
import 'package:mpflutter_template/samples/page_indicator.dart';
import 'package:mpflutter_template/samples/regular_tabs.dart';
import 'package:mpflutter_template/samples/safe_area.dart';
import 'package:mpflutter_template/samples/steps.dart';
import 'package:mpflutter_template/samples/tag.dart';

void main() {
  runApp(MyApp());
  MPCore().connectToHostChannel();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AntApp(
      theme: AntTheme.defaultTheme(),
      child: MPApp(
        title: 'MPFlutter Demo',
        color: Colors.blue,
        routes: {
          '/': (context) => HomePage(),
          '/button': (context) => ButtonPage(),
          '/auto_center': (context) => AutoCenterPage(),
          '/divider': (context) => DividerPage(),
          '/safe_area': (context) => SafeAreaPage(),
          '/capsule_tabs': (context) => CapsuleTabsPage(),
          '/jumbo_tabs': (context) => JumboTabsPage(),
          '/regular_tabs': (context) => RegularTabsPage(),
          '/avatar': (context) => AvatarPage(),
          '/card': (context) => CardPage(),
          '/list': (context) => ListPage(),
          '/page_indicator': (context) => PageIndicatorPage(),
          '/steps': (context) => StepsPage(),
          '/tag': (context) => TagPage(),
        },
        navigatorObservers: [MPCore.getNavigationObserver()],
      ),
    );
  }
}
