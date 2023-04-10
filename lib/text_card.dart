import 'package:astro_chat_ai/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextCard extends StatelessWidget {
  TextCard({Key? key, this.textData}) : super(key: key);

  var textData;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ThemeColors.primaryColor.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: ThemeColors.primaryColor.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(100)),
                  child: const Icon(
                    Icons.ac_unit,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    textData.text,
                    style: TextStyle(
                        fontSize: 18,
                        color: textData.text
                                .toString()
                                .contains("this is not a legal question")
                            ? Colors.redAccent
                            : null),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(width: 10),
                InkWell(
                    onTap: () {
                      Clipboard.setData(ClipboardData(text: textData.text));
                    },
                    child: const Icon(Icons.copy, size: 28)),
              ],
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

class MyTextCard extends StatelessWidget {
  MyTextCard({Key? key, this.textData}) : super(key: key);

  var textData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                color: ThemeColors.primaryColor.withOpacity(0.9),
                borderRadius: BorderRadius.circular(100)),
            child: const Icon(
              Icons.person,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              textData.text,
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
