import 'package:flutter/material.dart';
import 'package:telegram/app/shared/models/chat.dart';

class ChatWidget extends StatelessWidget {
  final Chat chat;
  final Function onTap;

  const ChatWidget({Key key, this.chat, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 28,
        backgroundImage: NetworkImage(chat.contact.photoUrl),
      ),
      title: Text(
        chat.contact.name,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(chat.message),
      trailing: Text(chat.lastTime),
      onTap: onTap,
    );
  }
}
