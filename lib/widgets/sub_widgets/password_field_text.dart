import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {

 final TextEditingController passwordTextFieldController;
  const PasswordTextField({Key? key,required this.passwordTextFieldController}) : super(key: key);
  @override

  // ignore: no_logic_in_create_state
  PasswordTextFieldState createState() => PasswordTextFieldState(passwordTextFieldController: passwordTextFieldController);
}

class PasswordTextFieldState extends State<PasswordTextField> {

  TextEditingController passwordTextFieldController;
  PasswordTextFieldState({required this.passwordTextFieldController});
  final textFieldFocusNode = FocusNode();
  bool obscured = true;

  void toggleObscured() {
    setState(() {
      obscured = !obscured;
      if (textFieldFocusNode.hasPrimaryFocus) return; // If focus is on text field, dont unfocus
      textFieldFocusNode.canRequestFocus = false;     // Prevents focus if tap on eye
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(controller: passwordTextFieldController,
      keyboardType: TextInputType.visiblePassword,
      obscureText: obscured,
      focusNode: textFieldFocusNode,
      decoration: InputDecoration(
        labelText: 'Password',
        labelStyle: const TextStyle(color: Color.fromARGB(255, 203, 203, 203)),
        floatingLabelBehavior: FloatingLabelBehavior.never, //Hides label on focus or if filled
        filled: true, // Needed for adding a fill color
        fillColor: Colors.white, 
        isDense: true,  // Reduces height a bit
        border: OutlineInputBorder( 
          borderSide: BorderSide.none,              // No border
          borderRadius: BorderRadius.circular(12),  // Apply corner radius
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
          child: GestureDetector(
            onTap: toggleObscured,
            child: Icon(
              obscured
                  ? Icons.visibility_rounded
                  : Icons.visibility_off_rounded,
              size: 24,
              color: Colors.red.shade400,
            ),
          ),
        ),
      ),
    );
  }
}