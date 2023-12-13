import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget({
    super.key,
    required this.masgindex,
    required this.msg,
  });

  final String msg;
  final int masgindex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                minRadius: 11,
                maxRadius: 11,
                foregroundImage: masgindex == 0
                    ? const AssetImage(
                        'assets/images/person.jpg',
                      )
                    : const AssetImage(
                        'assets/images/logo.png',
                      ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                masgindex == 0 ? 'you' : 'Tell Me',
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 33),
            child: masgindex == 0
                ? Text(
                    msg,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  )
                : DefaultTextStyle(
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                    child: AnimatedTextKit(
                      isRepeatingAnimation: false,
                       repeatForever: false,
                      animatedTexts: [
                        TyperAnimatedText(
                          msg.trim(),
                        ),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
