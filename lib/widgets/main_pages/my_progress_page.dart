import 'package:flutter/material.dart';
import 'package:smart_alert_demo_flutter/Enums/app_menu_item.dart';
import 'package:smart_alert_demo_flutter/utilitites/widgets_helper.dart';

import '../sub_widgets/custom_elevated_button.dart';

class MyProgressPage extends StatelessWidget {
  const MyProgressPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WidgetHelper.getWidgetViewMobileOrWeb(
        context, AppMenuItem.myProgress, constructMyProgressWidget(context));
  }

  Column constructMyProgressWidget(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: FittedBox(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.all(MediaQuery.of(context).size.width / 15),
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomElevatedButton(text: 'DAY'),
                      const SizedBox(
                        width: 1,
                      ),
                      CustomElevatedButton(text: 'WEEK'),
                      const SizedBox(
                        width: 1,
                      ),
                      CustomElevatedButton(text: 'MONTH'),
                      const SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all<double>(0),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.grey.shade400)),
                        onPressed: () => {},
                        child: const Icon(
                          Icons.arrow_back,
                          size: 20,
                        ),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all<double>(0),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white)),
                        onPressed: () => {},
                        child: Text(
                          DateTime.now().toString(),
                          style: const TextStyle(
                              color: Colors.black, fontSize: 18),
                        ),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all<double>(0),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.grey.shade400)),
                        onPressed: () => {},
                        child: const Icon(
                          Icons.arrow_forward,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    color: Colors.blue,
                    child: const SizedBox(child: Text('data')),
                  )
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: FittedBox(
            child: WidgetHelper.getFooterWithPadding(
                isLogin: false, context: context),
          ),
        )
      ],
    );
  }
}
