import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:youtube/model/video.dart';

const CHAVE_YOUTUBE_API = "AIzaSyD_skCZlY2DsLgT6XbMtf_S3LVc95QW9OY";
const CHANNEL_ID = "UCjjAsWFxFly81BbUcSHJa4g";
const URL_BASE = "https://www.googleapis.com/youtube/v3";

class Api {
  Future<List<Video>> pesquisar(String pesquisa) async {
    http.Response response = await http.get(
        "$URL_BASE/search?part=snippet&type=video&maxResults=10&order=date&channelId=$CHANNEL_ID&q=$pesquisa&key=${CHAVE_YOUTUBE_API}");

    if (response.statusCode == 200) {
      Map<String, dynamic> dadosJson = json.decode(response.body);
      List<Video> videos = dadosJson["items"].map<Video>(
          (videoMap) {
            return Video.fromJson(videoMap);
          }
      ).toList();

      return  videos;
    } else {

    }
  }
}
