import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import '../res/widget/sequare_button.dart';
import 'qr_code_proivder.dart';

class QRCodeDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final qrCode = context.watch<QRCodeProvider>().qrCode;
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff0052d4), Color(0xff4364f7), Color(0xff6fb1fc)],
              stops: [0, 0.5, 1],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: AppBar(
            title: const Text('Scan Info'),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Card(
              child: Container(
                height: size.height * 0.2,
                width: double.infinity,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        width: 2, color: Color.fromARGB(255, 101, 167, 221))),
                child: SingleChildScrollView(child: Text(qrCode)),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SequareButton(
                  title: 'Share',
                  onTap: () {
                    Share.share(qrCode);
                  },
                ),
                SequareButton(
                  title: 'Copy',
                  onTap: () {
                    Clipboard.setData(ClipboardData(text: qrCode)).then(
                      (value) => ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Copy')),
                      ),
                    );
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
