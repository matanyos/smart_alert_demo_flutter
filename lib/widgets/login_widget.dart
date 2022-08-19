import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:smart_alert_demo_flutter/utilities.dart';
import 'package:smart_alert_demo_flutter/widgets/forget_password_widget.dart';
import 'package:smart_alert_demo_flutter/widgets/password_field_text.dart';
import 'package:smart_alert_demo_flutter/widgets/widgets_helper.dart';

class LoginWidget extends StatefulWidget {
  final String? emailDefaultValue;

  const LoginWidget({Key? key, this.emailDefaultValue}) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  TextEditingController emailTextFieldController = TextEditingController();
  TextEditingController passwordTextFieldController = TextEditingController();

  bool wrongCredintials = false;

  @override
  Widget build(BuildContext context) {
    if (widget.emailDefaultValue != null) {
      emailTextFieldController.text = widget.emailDefaultValue.toString();
    }
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
      body:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 380),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
              child: Column(
                children: [
                  Stack(children: [
                    Visibility(
                        visible: widget.emailDefaultValue != null,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white)),
                          child: Text(
                              'An email with instructions for resetting your password has been sent to ${emailTextFieldController.text}',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Montserrat',
                                  fontSize: 15)),
                        )),
                    Visibility(
                        visible: wrongCredintials,
                        child: const Text(
                            'Login failed. Invalid password and/or username.',
                            style: TextStyle(color: Colors.red, fontSize: 15)))
                  ]),
                  const SizedBox(height: 20),
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
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 5, top: 20),
                      child: Text('Password:',
                          style: TextStyle(
                              fontFamily: 'Montserrat', color: Colors.white)),
                    ),
                  ),
                  SizedBox(
                    height: 45,
                    child: PasswordTextField(
                        passwordTextFieldController:
                            passwordTextFieldController),
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: GestureDetector(
                            child: MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: Text.rich(
                                TextSpan(
                                    style: const TextStyle(fontSize: 14),
                                    children: [
                                      TextSpan(
                                        style: const TextStyle(
                                            color: Colors.white,
                                            decoration:
                                                TextDecoration.underline),
                                        text: "Forget password?",
                                        recognizer: TapGestureRecognizer(),
                                      )
                                    ]),
                              ),
                            ),
                            onTap: () => {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ForgetPasswordWidget()))
                            },
                          ))),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: SizedBox(
                      width: 320,
                      height: 50,
                      child: ElevatedButton(
                          onPressed: () async {
                            if (emailTextFieldController.text != '' &&
                                passwordTextFieldController.text != '') {
                              if (await Utilities.tryLogin(
                                  email: emailTextFieldController.text,
                                  password: passwordTextFieldController.text)) {
                                Utilities.navigateToHomePage(context);
                              } else {
                                setState(() => wrongCredintials = true);
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
                          child: const Text('LOG IN')),
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
