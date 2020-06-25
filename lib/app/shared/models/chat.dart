import 'package:telegram/app/shared/models/contact.dart';

class Chat {
  Contact contact;
  String message;
  String lastTime;
  Chat({this.contact, this.message, this.lastTime});
}