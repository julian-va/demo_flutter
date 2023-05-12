import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entitis/answer.dart';
import 'package:yes_no_app/domain/entitis/message_dto.dart';

class ChatProvider extends ChangeNotifier {
  final _getYesNoAnswer = GetYesNoAnswer();
  final ScrollController chatScrollController = ScrollController();
  final List<MessageDto> _messageList = [
  ];

  List<MessageDto> getMessageList() {
    return _messageList;
  }

  Future<void> sendMessage(String message) async {
    if (message.isEmpty) return;
    if (message.endsWith('?')) {
      _herReply();
    }
    _messageList.add(MessageDto(text: message, fromWho: FromWho.mine));
    notifyListeners();
    _moveScrollToBottom();
  }

  Future<void> _moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut);
  }

  Future<void> _herReply() async {
    final AnswerDto answer = await _getYesNoAnswer.getAnswer();
    final message = MessageDto(
        text: answer.answer, fromWho: FromWho.others, imgUrl: answer.image);
    _messageList.add(message);
    notifyListeners();
    _moveScrollToBottom();
  }
}
