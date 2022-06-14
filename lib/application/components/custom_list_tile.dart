import 'package:flutter/material.dart';


class CustomListTile extends StatelessWidget {
  const CustomListTile({
    Key? key,
    required this.title,
    this.onTap,
  }) : super(key: key);

  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        hoverColor: Colors.teal.shade500,
        style: ListTileStyle.list,
        leading: const Icon(Icons.wallet_membership),
        title: Text(title),
        onTap: onTap,
      ),
    );
  }
}
