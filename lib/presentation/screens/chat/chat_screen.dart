import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/other_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shere/message_field_box.dart';

import '../../../domain/entitis/message_dto.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcThbpEoWJd4RIEeiUyvfc7aLAnnWtV6FaHoTQ&usqp=CAU'),
          ),
        ),
        title: const Text('Prueba chat screen'),
        centerTitle: false,
      ),
      body: const _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  const _ChatView();

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                  controller: chatProvider.chatScrollController,
              itemCount: chatProvider.getMessageList().length,
              itemBuilder: (context, index) {
                final message = chatProvider.getMessageList()[index];
                return (message.fromWho == FromWho.others)
                    ?  MyMessageBubble(message: message,)
                    :  OtherMessageBubble(message: message);
              },
            )),
             MessageFieldBox(onValue: (value) => chatProvider.sendMessage(value),)
          ],
        ),
      ),
    );
  }
}
