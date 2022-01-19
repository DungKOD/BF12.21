
import 'package:api_base/controllers/video_list_controller.dart';
import 'package:api_base/controllers/video_list_obs_controller.dart';
import 'package:api_base/models/video_model.dart';
import 'package:api_base/views/video_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowObsScreen extends StatelessWidget {
  const ShowObsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final VideoListObsController videoListObsController = Get.put(VideoListObsController());
    final  videoList = videoListObsController.videoListObs.value;

    // obs => static : obs.value
    return Scaffold(
      appBar: AppBar(
        title: Text("Show Screen"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.four_k_rounded),
          onPressed: (){
            Get.back(); // Navigator.pop(context);
          },
        ),
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(top: 20),
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: videoList.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  child: Card(
                      color: Colors.amber,
                      child: Column(
                        children: [
                          Image.network(videoList[index].url_photo!),
                          Text(videoList[index].title!)
                        ],
                      )
                  ),
                  onTap: (){
                    var route = MaterialPageRoute(builder: (context) => VideoDetailScreen(videoModel: videoList[index]));
                    Navigator.push(context, route);
                  },
                );
              }
          )
      ),
    );
  }
}
