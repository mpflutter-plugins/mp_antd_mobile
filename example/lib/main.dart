import 'package:flutter/widgets.dart';
import 'package:mp_antd_mobile/common/app.dart';
import 'package:mp_antd_mobile/common/theme.dart';
import 'package:mpcore/mpcore.dart';
import 'package:mpflutter_template/samples/auto_center.dart';
import 'package:mpflutter_template/samples/button.dart';
import 'package:mpflutter_template/samples/divider.dart';

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
          '/': (context) => ButtonPage(),
          '/auto_center': (context) => AutoCenterPage(),
          '/divider': (context) => DividerPage(),
        },
        navigatorObservers: [MPCore.getNavigationObserver()],
      ),
    );
  }
}