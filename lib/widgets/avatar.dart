import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    Key? key,
    required this.radius,
    this.onTap,
  }) : super(key: key);

  const Avatar.small({
    Key? key,
    this.onTap,
  })  : radius = 18,
        super(key: key);

  const Avatar.medium({
    Key? key,
    this.onTap,
  })  : radius = 26,
        super(key: key);

  const Avatar.large({
    Key? key,
    this.onTap,
  })  : radius = 34,
        super(key: key);

  final double radius;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: _avatar(context),
    );
  }

  Widget _avatar(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: AssetImage('images/avatar.png'),
      backgroundColor: Theme.of(context).cardColor,
    );
  }
}
