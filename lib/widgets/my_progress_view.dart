
import 'package:flutter/material.dart';
import 'package:smart_alert_demo_flutter/widgets/widgets_helper.dart';

class MyProgressViewWidget extends StatelessWidget {
  const MyProgressViewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FittedBox(
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
                        style:
                            const TextStyle(color: Colors.black, fontSize: 18),
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
                  child: const Text('data'),
                )
              ],
            ),
          ),
        ),
        WidgetHelper.getFooterWithPadding(isLogin: false, context: context)
      ],
    );
  }
}

// ignore: must_be_immutable
class CustomElevatedButton extends StatefulWidget {
  late String text='';
  late double fontSize = 0;
  late double elevation = 0;

  CustomElevatedButton(
      {Key? key, required this.text, double? fontSize, double? elevation})
      : super(key: key) {
    this.fontSize = fontSize ?? 18;
    this.elevation = elevation ?? 0;
  }

  @override
  State<CustomElevatedButton> createState() => _CustomElevatedButtonState();
}


class _CustomElevatedButtonState extends State<CustomElevatedButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          elevation: MaterialStateProperty.all<double>(widget.elevation),
          backgroundColor: MaterialStateProperty.all<Color>(
              isPressed?Colors.white: const Color.fromARGB(255, 26, 34, 37))),
      child: Text(widget.text, style: TextStyle(fontSize: widget.fontSize,color: isPressed? const Color.fromARGB(255, 26, 34, 37):Colors.white)),
      onPressed: () => {setState(()=>isPressed = true)},
    );
  }
}
