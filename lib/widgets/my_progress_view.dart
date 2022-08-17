import 'package:flutter/material.dart';
import 'package:smart_alert_demo_flutter/widgets/widgets_helper.dart';

class MyProgressViewWidget extends StatelessWidget {
  const MyProgressViewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(200,50,200,50),
      child: Column(
        children: [
          Expanded(flex : 5,child: Container(height: 900,width: 400, color: Colors.blue)),
          WidgetHelper.getViewsFooter()
        ],
      )
    );
  }
}
