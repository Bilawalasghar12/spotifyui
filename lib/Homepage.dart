import 'package:flutter/material.dart';

import 'mainscreen.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      backgroundColor: Colors.white,
    extendBodyBehindAppBar: true,
    appBar: AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    leadingWidth: 140.0,

      leading: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              customBorder: const CircleBorder(),
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(6.0),
                decoration: const BoxDecoration(
                  color: Colors.black26,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.chevron_left, size: 28.0),
              ),
            ),
            const SizedBox(width: 16.0),
            InkWell(
              customBorder: const CircleBorder(),
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(6.0),
                decoration: const BoxDecoration(
                  color: Colors.black26,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.chevron_right, size: 28.0),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton.icon(
          style: TextButton.styleFrom(
            primary: Theme.of(context).iconTheme.color,
          ),
          onPressed: () {},
          icon: const Icon(
            Icons.account_circle_outlined,
            size: 30.0,
          ),
          label: const Text('Marcus Ng'),
        ),
        const SizedBox(width: 8.0),
        IconButton(
          padding: const EdgeInsets.only(),
          icon: const Icon(Icons.keyboard_arrow_down, size: 30.0, color: Colors.black,),
          onPressed: () {},
        ),
        const SizedBox(width: 20.0),
      ],
    ),
      body:  Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              //const Color(0xFFAF1089),
              Color(0xFFFF0000),
              Theme.of(context).backgroundColor,
            ],
            stops: const [0, 0.9],
          ),
        ),

        child: MainScreen(),

    )
    );

  }
}

