import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:telegram/app/modules/home/widgets/chat.dart';
import 'package:telegram/app/modules/home/widgets/drawer.dart';
import 'package:telegram/app/shared/models/chat.dart';
import 'package:telegram/app/shared/models/contact.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  List<Chat> _chats = [
    Chat(contact: Contact(name: 'Ms. Princess Dickens', photoUrl: 'https://s3.amazonaws.com/uifaces/faces/twitter/idiot/128.jpg'), message: 'aut exercitationem ullam', lastTime: '22:56'),
    Chat(contact: Contact(name: 'Annabelle MacGyver', photoUrl: 'https://s3.amazonaws.com/uifaces/faces/twitter/panchajanyag/128.jpg'), message: 'impedit dolor quos', lastTime: '22:56'),
    Chat(contact: Contact(name: 'Geovanni Smith', photoUrl: 'https://s3.amazonaws.com/uifaces/faces/twitter/newbrushes/128.jpg'), message: 'vero aliquid aut', lastTime: '22:56'),
    Chat(contact: Contact(name: 'Aileen Thiel', photoUrl: 'https://s3.amazonaws.com/uifaces/faces/twitter/pehamondello/128.jpg'), message: 'saepe inventore dicta', lastTime: '22:56'),
    Chat(contact: Contact(name: 'Shaina Torp', photoUrl: 'https://s3.amazonaws.com/uifaces/faces/twitter/elenadissi/128.jpg'), message: 'dolorum quas blanditiis', lastTime: '22:56'),
    Chat(contact: Contact(name: 'Gloria Will', photoUrl: 'https://s3.amazonaws.com/uifaces/faces/twitter/lebronjennan/128.jpg'), message: 'vel quisquam et', lastTime: '22:56'),
    Chat(contact: Contact(name: 'Bethany Abbott', photoUrl: 'https://s3.amazonaws.com/uifaces/faces/twitter/cggaurav/128.jpg'), message: 'consequatur iure omnis', lastTime: '22:56'),
    Chat(contact: Contact(name: 'Ethelyn Bernier', photoUrl: 'https://s3.amazonaws.com/uifaces/faces/twitter/agromov/128.jpg'), message: 'ad soluta ut', lastTime: '22:56'),
    Chat(contact: Contact(name: 'Judah Frami', photoUrl: 'https://s3.amazonaws.com/uifaces/faces/twitter/carlosgavina/128.jpg'), message: 'deleniti quidem et', lastTime: '22:56'),
    Chat(contact: Contact(name: 'Michale Hintz', photoUrl: 'https://s3.amazonaws.com/uifaces/faces/twitter/calebogden/128.jpg'), message: 'quibusdam est perferendis', lastTime: '22:55'),
    Chat(contact: Contact(name: 'Ole Schroeder', photoUrl: 'https://s3.amazonaws.com/uifaces/faces/twitter/mfacchinello/128.jpg'), message: 'accusantium aut perferendis', lastTime: '22:55'),
    Chat(contact: Contact(name: 'Tia Turcotte Jr.', photoUrl: 'https://s3.amazonaws.com/uifaces/faces/twitter/antonyzotov/128.jpg'), message: 'dolor reiciendis sint', lastTime: '22:34'),
    Chat(contact: Contact(name: 'Reva Jacobi', photoUrl: 'https://s3.amazonaws.com/uifaces/faces/twitter/ajaxy_ru/128.jpg'), message: 'tempore itaque quis', lastTime: '22:33'),
    Chat(contact: Contact(name: 'Ms. Savanah Fadel', photoUrl: 'https://s3.amazonaws.com/uifaces/faces/twitter/maximsorokin/128.jpg'), message: 'pariatur ducimus quia', lastTime: '21:51'),
    
  ];

  _gotoChats(Chat chat) async {
    print("Chamou");
    Modular.to.pushNamed('/chat', arguments: chat);
  }

  AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Telegram Clone'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: (){},)
        ],
      ),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.edit), onPressed: (){},),
      drawer: DrawerWidget(),
      body: ListView.separated(
        itemBuilder: (_, i) => ChatWidget(chat: _chats[i], onTap: () { _gotoChats(_chats[i]); },),
         separatorBuilder: (ctx, i) {
            return Divider();
          },
        itemCount: _chats.length),
    );
  }
}
