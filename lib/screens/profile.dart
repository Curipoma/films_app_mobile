import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: const <Widget>[
          Text(
            'Mi perfil',
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
