import 'package:ai_chat_application/controller/chat_controller.dart';
import 'package:ai_chat_application/utilis/color_const.dart';
import 'package:ai_chat_application/utilis/text_const.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatScreen extends ConsumerWidget {
  const ChatScreen({super.key});

  static final ChatUser user = ChatUser(id: '1', firstName: 'Dev');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messages = ref.watch(chatProvider);
    final chatNotifier = ref.read(chatProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 60,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              "https://images.playground.com/9555cf8affc845c893baccee78d6c4fd.jpeg",
            ),
          ),
        ),
        toolbarHeight: 80,
        backgroundColor: ColorConst.foregroundcolor,
        title: Text("Gemini"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert_outlined, size: 35),
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(gradient: ColorConst.background),
        child: DashChat(
          currentUser: user,
          onSend: (ChatMessage message) {
            chatNotifier.sendMessage(message);
          },
          inputOptions: InputOptions(
            alwaysShowSend: true,
            cursorStyle:
                CursorStyle(color: ColorConst.black1, hide: true, width: 1),
            sendOnEnter: true,
            inputToolbarPadding: EdgeInsets.all(4),
            inputToolbarStyle: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: ColorConst.background,
            ),
            inputTextStyle: TextConst.inputStyle,
          ),
          messageListOptions: MessageListOptions(
            scrollPhysics: BouncingScrollPhysics(),
          ),
          scrollToBottomOptions: ScrollToBottomOptions(disabled: false),
          messageOptions: MessageOptions(
            containerColor: ColorConst.botMessageContainer,
            textColor: Colors.white,
            avatarBuilder: (_, __, ___) => CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://images.playground.com/9555cf8affc845c893baccee78d6c4fd.jpeg"),
            ),
            borderRadius: 20,
            currentUserContainerColor: ColorConst.userContainer,
            currentUserTextColor: ColorConst.userContainerText,
            showOtherUsersAvatar: true,
          ),
          typingUsers: const [],
          messages: messages,
        ),
      ),
    );
  }
}
