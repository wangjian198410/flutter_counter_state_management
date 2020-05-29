import 'package:flutter/widgets.dart';

class BaseInfoContainer extends InheritedWidget {
  final BaseInfo baseInfo = BaseInfo();

  BaseInfoContainer({Key key, @required Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(BaseInfoContainer oldWidget) {
    return baseInfo.title != oldWidget.baseInfo.title;
  }

  static BaseInfo of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<BaseInfoContainer>()
        .baseInfo;
  }
}

class BaseInfo {
  final title = "test title";
}
