import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constant/font.dart';

class SequareButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool loading;
  Color? btnColor;
  Color? textColor;
  SequareButton(
      {Key? key,
      required this.title,
      required this.onTap,
      this.btnColor,
      this.textColor,
      this.loading = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Container(
            width: size.width * 0.3,
            height: size.height * 0.06,
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            // height: 47,
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xff0052d4),
                    Color(0xff4364f7),
                    Color(0xff6fb1fc)
                  ],
                  stops: [0, 0.5, 1],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(5)),
            child: Text(
              title,
              style: TextStyle(
                  fontFamily: TFont.ralewayBold,
                  fontSize: 15,
                  color: Colors.white),
            )),
      ),
    );
  }
}
