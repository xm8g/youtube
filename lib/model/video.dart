class Video {
  String id;
  String title;
  String image;
  String channel;
  String description;

  Video({this.id, this.title, this.image, this.channel, this.description});

  factory Video.fromJson(Map<String, dynamic> map) {
    return Video(
      id: map["id"]["videoId"],
      title: map["snippet"]["title"],
      image: map["snippet"]["thumbnails"]["high"]["url"],
      channel: map["snippet"]["channelId"],
      description: map["snippet"]["description"]
    );
  }

  @override
  String toString() {
    return 'Video{title: $title}';
  }
}