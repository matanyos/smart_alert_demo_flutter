import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:smart_alert_demo_flutter/utilitites/platform_info.dart';
import 'package:smart_alert_demo_flutter/utilitites/utilities.dart';
import 'package:smart_alert_demo_flutter/utilitites/widgets_helper.dart';
import '../../routes/router.gr.dart';
import '../sub_widgets/password_field_text.dart';
import '../sub_widgets/smart_alert_app_bar.dart';

class LoginPage extends StatefulWidget {
  final String? emailDefaultValue;

  const LoginPage({Key? key, this.emailDefaultValue}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailTextFieldController = TextEditingController();
  TextEditingController passwordTextFieldController = TextEditingController();

  bool wrongCredintials = false;

  @override
  Widget build(BuildContext context) {
    if (widget.emailDefaultValue != null) {
      emailTextFieldController.text = widget.emailDefaultValue.toString();
    }
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: const SmartAlertAppBar(),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: FittedBox(
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 400),
                      margin: EdgeInsets.fromLTRB(
                          10,
                          PlatformInfo(context).getScreenSize().height / 15,
                          10,
                          0),
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
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 15)))
                          ]),
                          const SizedBox(height: 20),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 5),
                              child: Text('E-mail:',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      color: Colors.white)),
                            ),
                          ),
                          SizedBox(
                            height: 45,
                            child: TextField(
                                controller: emailTextFieldController,
                                decoration: InputDecoration(
                                    labelText: 'E-mail',
                                    labelStyle: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 203, 203, 203)),
                                    floatingLabelBehavior: FloatingLabelBehavior
                                        .never, //Hides label on focus or if filled
                                    filled:
                                        true, // Needed for adding a fill color
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
                                      fontFamily: 'Montserrat',
                                      color: Colors.white)),
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
                                            style:
                                                const TextStyle(fontSize: 14),
                                            children: [
                                              TextSpan(
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    decoration: TextDecoration
                                                        .underline),
                                                text: "Forget password?",
                                                recognizer:
                                                    TapGestureRecognizer(),
                                              )
                                            ]),
                                      ),
                                    ),
                                    onTap: () => {
                                      AutoRouter.of(context)
                                          .pushNamed('/forgot-password')
                                    },
                                  ))),
                          SizedBox(
                            height:
                                PlatformInfo(context).getScreenSize().height /
                                    20,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                                onPressed: onLoginButtonPressed,
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.red.shade400),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            side: BorderSide(
                                                color: Colors.red.shade400)))),
                                child: const Text('LOG IN')),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                    child: FittedBox(
                  child: WidgetHelper.getFooterWithPadding(
                      isLogin: true, context: context),
                ))
              ]),
        ),
        backgroundColor: const Color.fromARGB(255, 28, 34, 37),
      ),
    );
  }

  onLoginButtonPressed() async {
    if (emailTextFieldController.text != '' &&
        passwordTextFieldController.text != '') {
      if (await Utilities.tryLogin(
          email: emailTextFieldController.text,
          password: passwordTextFieldController.text)) {
        var router = AutoRouter.of(context);

        var user = await Utilities.getUserInfo();
        if (user != null) {
          router.push(HomeRoute(user: user));
        }
      } else {
        setState(() => wrongCredintials = true);
      }
    }
  }
}
