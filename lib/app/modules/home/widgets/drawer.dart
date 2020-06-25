import 'package:flutter/material.dart';
import 'package:telegram/lang/default.dart';
import 'package:telegram/lang/lang.dart';

class DrawerWidget extends StatefulWidget {
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  ILanguage get content {
    return Lang.of(context).content;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('Adolph Cartwright'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://s3.amazonaws.com/uifaces/faces/twitter/imammuht/128.jpg'),
            ),
            accountEmail: Text('+55 574495-4764'),
          ),
          ItemDrawer(
            text: content.menuContacts,
            icon: Icons.perm_contact_calendar,
            onTab: () {},
          ),
          ItemDrawer(
            text: content.menuSettings,
            icon: Icons.settings,
            onTab: () {},
          ),
          ItemDrawer(
            text: content.menuInvide,
            icon: Icons.person_add,
            onTab: () {},
          ),
          ItemDrawer(
            text: content.menuHelp,
            icon: Icons.help,
            onTab: () {},
          ),
          Divider()
        ],
      ),
    );
  }
}

class ItemDrawer extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function onTab;

  const ItemDrawer({Key key, this.text, this.icon, this.onTab})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: this.onTab,
      leading: Icon(this.icon),
      title: Text(
        this.text,
        style: TextStyle(
          fontSize: 16,
        ),
      ),
      dense: true,
    );
  }
}
