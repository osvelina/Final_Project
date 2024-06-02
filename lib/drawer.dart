import 'package:flutter/material.dart';

class Drawerscreen extends StatefulWidget {
  const Drawerscreen({super.key});

  @override
  State<Drawerscreen> createState() => _DrawerscreenState();
}

class _DrawerscreenState extends State<Drawerscreen> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text('Osvelina Siregar'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("assets/images/osve.jpg"),
            ),
            accountEmail: Text("osvelina@gmail.com"),
          ),
          DrawerListTile(
            iconData: Icons.group,
            title: "New Group",
            onTilePressed: () {},
          ),
           DrawerListTile(
            iconData: Icons.lock,
            title: "New Secreat Group",
            onTilePressed: () {},
          ),
           DrawerListTile(
            iconData: Icons.notifications,
            title: "New Chanel Chat",
            onTilePressed: () {},
          ),
           DrawerListTile(
            iconData: Icons.contacts,
            title: "contacts",
            onTilePressed: () {},
          ),
           DrawerListTile(
            iconData: Icons.bookmark_border,
            title: "Saved Massages",
            onTilePressed: () {},
          ),
           DrawerListTile(
            iconData: Icons.phone,
            title: "Calss",
            onTilePressed: () {},
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  final IconData? iconData;
  final String? title; // 
  final VoidCallback? onTilePressed;

  const DrawerListTile({
    Key? key,
    this.iconData,
    this.title,
    this.onTilePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTilePressed,
      dense: true,
      leading: Icon(iconData),
      title: Text(
        title!,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
