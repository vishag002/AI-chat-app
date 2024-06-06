import 'package:ai_chat_application/utilis/color_const.dart';
import 'package:ai_chat_application/utilis/text_const.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  //CHAT USERS
  ChatUser user = ChatUser(
    id: '1',
    firstName: 'Dev',
  );
  ChatUser gemini = ChatUser(
    id: '2',
    firstName: 'Gemini',
  );
  //list for messages
  List<ChatMessage> messages = <ChatMessage>[
    ChatMessage(
      text: "hello how can i help u?",
      user: ChatUser(id: '2'),
      createdAt: DateTime.now(),
    )
  ];
  //on send  function-- m is the variable
  getdata(ChatMessage m) {
    messages.insert(0, m);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 60,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.deepPurple.shade900,
                image: DecorationImage(
                    image: NetworkImage(
                        "https://images.playground.com/9555cf8affc845c893baccee78d6c4fd.jpeg"))),
          ),
        ),
        toolbarHeight: 80,
        backgroundColor: ColorConst.foregroundcolor,
        title: Text("gemini"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert_outlined,
                size: 35,
              ))
        ],
      ),
      body: Container(
        height: screenHeight,
        width: screenWidth,
        decoration: BoxDecoration(gradient: ColorConst.background),
        child: DashChat(
          currentUser: user,
          onSend: (ChatMessage m) {
            getdata(m);
          },
          inputOptions: InputOptions(
              alwaysShowSend: true,
              cursorStyle:
                  CursorStyle(color: ColorConst.black1, hide: true, width: 1),
              focusNode: FocusScopeNode(),
              sendOnEnter: true,
              showTraillingBeforeSend: true,
              inputToolbarMargin: EdgeInsets.all(0),
              inputToolbarPadding: EdgeInsets.all(4),
              inputToolbarStyle: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: ColorConst.background),
              inputTextStyle: TextConst.inputStyle),
          messageListOptions: MessageListOptions(
            scrollPhysics: BouncingScrollPhysics(),
          ),
          scrollToBottomOptions: ScrollToBottomOptions(
            disabled: false,
          ),
          messageOptions: MessageOptions(
            containerColor: ColorConst.botMessageContainer,
            textColor: Colors.white,
            bottom: (message, previousMessage, nextMessage) => Container(
              height: 0,
            ),
            avatarBuilder: (p0, onPressAvatar, onLongPressAvatar) => Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: Colors.deepPurple.shade900,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://images.playground.com/9555cf8affc845c893baccee78d6c4fd.jpeg"))),
            ),
            borderRadius: 20,
            currentUserContainerColor: ColorConst.userContainer,
            currentUserTextColor: ColorConst.userContainerText,
            showOtherUsersAvatar: true,
          ),
          typingUsers: [ChatUser(id: '1')],
          messages: messages,
        ),
      ),
    );
  }
}
