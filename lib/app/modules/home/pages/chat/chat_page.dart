import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:telegram/app/modules/home/pages/chat/chat_controller.dart';
import 'package:telegram/app/shared/models/chat.dart';
import 'package:telegram/lang/lang.dart';

class ChatPage extends StatefulWidget {
  final Chat chat;
  const ChatPage({Key key, this.chat}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

const DecorationBackground = BoxDecoration(
  image: DecorationImage(
    image: AssetImage("assets/images/background.jpg"),
    fit: BoxFit.cover,
  ),
);

class _ChatPageState extends State<ChatPage> {
  ChatController controller = Modular.get<ChatController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: NetworkImage(widget.chat.contact.photoUrl),
            ),
            Padding(
                padding: EdgeInsets.only(left: 5),
                child: Text(widget.chat.contact.name.split(" ")[0])),
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: DecorationBackground,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  child: Container(),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              decoration: DecorationBackground,
              child: SingleChildScrollView(
                child: Card(
                    child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: TextField(
                          onChanged: controller.writingMessage,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: Lang.of(context).content.writeMessage),
                        ),
                      ),
                    ),
                    Observer(
                      builder: (_) => controller.message == ""
                          ? IconButton(
                              icon: Icon(
                                Icons.camera_alt,
                                color: Colors.grey,
                              ),
                              onPressed: () {},
                            )
                          : Text(""),
                    ),
                    Observer(
                      builder: (_) => controller.message == ""
                          ? IconButton(
                              icon: Icon(
                                Icons.attach_file,
                                color: Colors.grey,
                              ),
                              onPressed: () {},
                            )
                          : Text(""),
                    ),
                    Observer(
                      builder: (_) => controller.message != ""
                          ? IconButton(
                              icon: Icon(
                                Icons.send,
                                color: Theme.of(context).accentColor,
                              ),
                              onPressed: () {},
                            )
                          : Text(""),
                    ),
                  ],
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
