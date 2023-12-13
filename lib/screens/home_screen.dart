import 'package:ai_chat/models/chat_model.dart';
import 'package:ai_chat/services/send_message_service.dart';
import 'package:ai_chat/widgets/message_widget.dart';
import 'package:ai_chat/widgets/popupmenu_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isTyping = false;
  final messageController = TextEditingController();
  List<ChatModel> chatList = [];
  final ScrollController scrollController = ScrollController();

  void scroll() {
    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 1), curve: Curves.bounceIn);
  }

  Future<void> sendMessage() async {
    if (messageController.text.isEmpty) {
      return;
    }
    setState(() {
      isTyping = true;
      chatList.add(
        ChatModel(
          msg: messageController.text,
          chatIndex: 0,
        ),
      );
    });
    chatList.addAll(
      await SendMessageService().sendMessage(
        msg: messageController.text,
      ),
    );

    setState(() {
      messageController.clear();
      isTyping = false;
    });
    scroll();
  }

  @override
  void dispose() {
    super.dispose();
    messageController.dispose();
    scrollController.dispose();
    chatList.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Row(
          children: [
            GestureDetector(
              child: Image.asset(
                'assets/images/menu-icon.png',
                color: Colors.white,
                width: 22,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            const Text(
              'Tell Me',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
        actionsIconTheme: const IconThemeData(color: Colors.white),
        actions: const [
          PopupMenuWidget(),
        ],
      ),
      body: Column(
        children: [
          Flexible(
            child: ListView.builder(
              controller: scrollController,
              itemCount: chatList.length,
              itemBuilder: (context, index) => MessageWidget(
                msg: chatList[index].msg,
                masgindex: chatList[index].chatIndex,
              ),
            ),
          ),
          if (isTyping) ...[
            const SpinKitThreeBounce(
              color: Colors.white,
              size: 20,
            ),
          ],
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Row(
              children: [
                const Spacer(
                  flex: 1,
                ),
                SizedBox(
                  width: 270,
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    controller: messageController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(15),
                      hintText: 'Message',
                      hintStyle: const TextStyle(
                        color: Color(0xffb2b1bd),
                        height: 0,
                      ),
                      filled: true,
                      fillColor: const Color(0xff343338),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xffb2b1bd),
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: IconButton(
                    onPressed: () {
                      sendMessage();
                    },
                    icon: const Icon(
                      Icons.send,
                      color: Color(0xff371d71),
                    ),
                  ),
                ),
                const Spacer(
                  flex: 2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
