import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entitis/message_dto.dart';

class MyMessageBubble extends StatelessWidget {
  final MessageDto message;
  const MyMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration:  BoxDecoration(color: colors.primary,borderRadius: BorderRadius.circular(20)),
          child:  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              style: const TextStyle(color: Colors.white),
              message.text
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        _ImageBubble(imgUrl: message.imgUrl),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }
}
class _ImageBubble extends StatelessWidget {
  final String ?imgUrl;
  const _ImageBubble({required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // TODO: implement build
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        imgUrl!,
        width: size.width * 0.7,
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            width: size.width * 0.7,
            height: 150,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: const Text('Se esta enviando una imagen de prueba'),
          );
        },
      ),
    );
  }
}