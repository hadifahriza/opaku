import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.leadingIcon,
    this.actionIcon,
    this.leadingOnPressed,
    this.actionOnPressed,
    required this.title,
  }) : super(key: key);

  final IconData? leadingIcon;
  final IconData? actionIcon;
  final void Function()? leadingOnPressed;
  final void Function()? actionOnPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shadowColor: Theme.of(context).accentColor.withAlpha(26),
      leading: leadingIcon == null ? null : IconButton(
        onPressed: leadingOnPressed,
        icon: Icon(
          leadingIcon,
        ),
      ),
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold
        ),
      ),
      actions: actionIcon == null ? null : <Widget>[
        IconButton(
          onPressed: actionOnPressed,
          icon: Icon(
            actionIcon,
          )
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60.0);
}