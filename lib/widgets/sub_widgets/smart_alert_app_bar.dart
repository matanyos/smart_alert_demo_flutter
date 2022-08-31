import 'package:flutter/material.dart';

class SmartAlertAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SmartAlertAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Container(
          alignment: Alignment.center,
          child: Column(children: [
            SizedBox(height: 100, child: Image.asset('assets/icon.png')),
            const Text("Smart Alert",
                style: TextStyle(
                    fontFamily: 'Montserrat', letterSpacing: 1, fontSize: 26)),
          ])),
      backgroundColor: const Color.fromARGB(255, 26, 34, 37),
      toolbarHeight: 180,
    );
  }

  @override
  Size get preferredSize {
    return const Size.fromHeight(180);
  }
}
