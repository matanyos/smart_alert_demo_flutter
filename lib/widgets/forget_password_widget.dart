import 'package:flutter/material.dart';
import 'package:smart_alert_demo_flutter/utilitites/utilities.dart';
import 'package:smart_alert_demo_flutter/widgets/login_widget.dart';
import 'package:smart_alert_demo_flutter/widgets/widgets_helper.dart';

class ForgetPasswordWidget extends StatefulWidget {
  const ForgetPasswordWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<ForgetPasswordWidget> createState() => _ForgetPasswordWidgetState();
}

class _ForgetPasswordWidgetState extends State<ForgetPasswordWidget> {
  TextEditingController emailTextFieldController = TextEditingController();

  bool wrongCredintials = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Container(
            alignment: Alignment.center,
            child: Column(children: [
              SizedBox(height: 100, child: Image.asset('assets/logo.png')),
              const Text("Smart Alert",
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      letterSpacing: 1,
                      fontSize: 26)),
            ])),
        backgroundColor: const Color.fromARGB(255, 26, 34, 37),
        toolbarHeight: 180,
      ),
      body: Column(children: [
        Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 380),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
              child: Column(
                children: [
                  const Text('Request new password',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  const SizedBox(height: 30),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Text('E-mail:',
                          style: TextStyle(
                              fontFamily: 'Montserrat', color: Colors.white)),
                    ),
                  ),
                  SizedBox(
                    height: 45,
                    child: TextField(
                        controller: emailTextFieldController,
                        decoration: InputDecoration(
                            labelText: 'E-mail',
                            labelStyle: const TextStyle(
                                color: Color.fromARGB(255, 203, 203, 203)),
                            floatingLabelBehavior: FloatingLabelBehavior
                                .never, //Hides label on focus or if filled
                            filled: true, // Needed for adding a fill color
                            fillColor: Colors.white,
                            isDense: true, // Reduces height a bit
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none, // No border
                              borderRadius: BorderRadius.circular(
                                  12), // Apply corner radius
                            ))),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: 320,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () async {
                          if (emailTextFieldController.text != '') {
                            if (await Utilities.tryRequestNewPassword(
                                email: emailTextFieldController.text)) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginWidget(
                                          emailDefaultValue:
                                              emailTextFieldController.text)));
                            }
                          }
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.red.shade400),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    side: BorderSide(
                                        color: Colors.red.shade400)))),
                        child: const Text('SUBMIT')),
                  ),
                  const SizedBox(height: 30),
                  const Text('OR',
                      style: TextStyle(color: Colors.white, fontSize: 22)),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: SizedBox(
                      width: 320,
                      height: 50,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginWidget()));
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.transparent),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      side: const BorderSide(
                                          color: Colors.white)))),
                          child: const Text('Back to Login')),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
            child: WidgetHelper.getFooterWithPadding(
                isLogin: true, context: context))
      ]),
      backgroundColor: const Color.fromARGB(255, 28, 34, 37),
    );
  }
}
