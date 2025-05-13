import 'package:flutter/material.dart';
import 'package:flutter_application/consts/colors.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgDarkColor,
      appBar: AppBar(
        backgroundColor: bgDarkColor,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search, color: Colors.white,)),
        ],
        leading: Icon(Icons.sort_rounded, color: Colors.white,),
        title: Text(
          "Home",
          style: TextStyle(
            fontFamily: "bold",
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 100,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.only(bottom: 4),
              child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                tileColor: bgColor,
                title: Text("Music name", style:TextStyle(
                  fontFamily: "bold",
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              subtitle: Text("Artist name", style:TextStyle(
                  fontFamily: "regular",
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              leading: Icon(Icons.music_note, color: Colors.white, size: 32,),
              trailing: Icon(Icons.play_arrow, color: Colors.white, size: 26,),
              )
            );
          },
        ),
      ),
    );
  }
}