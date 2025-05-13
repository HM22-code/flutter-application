import 'package:flutter/material.dart';
import 'package:flutter_application/consts/colors.dart';
import 'package:flutter_application/controllers/player_controller.dart';
import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {

    var controller = Get.put(PlayerController());

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
      body: FutureBuilder<List<SongModel>>(
        future: controller.audioQuery.querySongs(
          ignoreCase: true,
          orderType: OrderType.ASC_OR_SMALLER,
          sortType: null,
          uriType: UriType.EXTERNAL,
        ),
        builder: (BuildContext context, snapshot) {
          if (snapshot.data == null) {
            return const Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            );
          } else if (snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                "No Songs Found",
                style: TextStyle(
                  fontFamily: "bold",
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text(
                "Error Occurred",
                style: TextStyle(
                  fontFamily: "bold",
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            );
          } else {
            return Padding(
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
                      title: Text(
                        snapshot.data![index].displayNameWOExt,
                        style:TextStyle(
                        fontFamily: "bold",
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Text(
                        "${snapshot.data![index].artist}",
                        style:TextStyle(
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
            );
          }
        },
      )
    );
  }
}