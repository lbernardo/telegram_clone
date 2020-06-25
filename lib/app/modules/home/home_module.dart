import 'package:telegram/app/modules/home/pages/chat/chat_controller.dart';
import 'package:telegram/app/modules/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:telegram/app/modules/home/home_page.dart';
import 'package:telegram/app/modules/home/pages/chat/chat_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ChatController()),
        Bind((i) => HomeController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => HomePage()),
        Router('/chat', child: (_,args) => ChatPage(chat: args.data,)),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
