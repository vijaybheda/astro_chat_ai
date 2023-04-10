import 'package:astro_chat_ai/theme/colors.dart';
import 'package:astro_chat_ai/theme/text_theme.dart';
import 'package:flutter/material.dart';

class SearchTextFieldWidget extends StatelessWidget {
  final TextEditingController? textEditingController;
  final VoidCallback? onTap;
  var color;

  SearchTextFieldWidget({
    Key? key,
    this.color,
    this.textEditingController,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _searchTextField();
  }

  Widget _searchTextField() {
    return Container(
      margin: const EdgeInsets.only(left: 4, right: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(.2),
                      offset: const Offset(0.0, 0.50),
                      spreadRadius: 1,
                      blurRadius: 1,
                    )
                  ]),
              child: Column(
                children: [
                  Row(
                    children: [
                      const SizedBox(width: 10),
                      Expanded(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxHeight: 60),
                          child: Scrollbar(
                            child: TextField(
                              style: const TextStyle(fontSize: 14),
                              controller: textEditingController,
                              maxLines: null,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 12),
                                border: InputBorder.none,
                                hintText: "Astro Waiting for your query...",
                                hintStyle: AppFontStyle.bodyMedium?.copyWith(
                                  color: ThemeColors.black10.withOpacity(0.18),
                                ),
                                counterText: "",
                                filled: false,
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        ThemeColors.black10.withOpacity(0.18),
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        ThemeColors.black10.withOpacity(0.18),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 5),
          InkWell(
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(
                  color: color, borderRadius: BorderRadius.circular(40)),
              padding: const EdgeInsets.all(10),
              child: const Icon(
                Icons.send,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 6)
        ],
      ),
    );
  }
}
