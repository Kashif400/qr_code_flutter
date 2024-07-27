import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constant/font.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final String content;

  final IconData icon;
  final VoidCallback onTap;
  final bool loading;
  Color? btnColor;
  Color? textColor;
  RoundButton(
      {Key? key,
      required this.title,
      required this.content,
      required this.icon,
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
            padding: const EdgeInsets.all(15),
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
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // SizedBox(
                    //   width: size.width * 0.02,
                    // ),
                    CircleAvatar(
                      radius: 32,
                      backgroundColor: Colors.white,
                      child: Icon(
                        size: size.height * 0.04,
                        icon,
                        color: Color.fromARGB(255, 42, 122, 250),
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.05,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                              fontFamily: TFont.loraBold,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          content,
                          style: TextStyle(
                              fontFamily: TFont.ralewayRegular,
                              fontSize: 15,
                              color: Colors.white),
                        )
                      ],
                    )
                  ],
                )
              ],
            )),
      ),
    );
  }
}
