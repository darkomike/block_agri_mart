import 'package:block_agri_mart/application/components/custom_list_tile.dart';
import 'package:block_agri_mart/application/state/app.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          CustomListTile(
            title: 'Logout',
            onTap: () {
              context.read<AppStateManager>().setIsLoggedIn(false);
            },
          )
        ],
      ),
    );
  }
}
