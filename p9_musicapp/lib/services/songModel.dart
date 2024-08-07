class SongModel {
  late String artistName;
  late String trackName;
  late String artworkUrl100;
  late String previewURL;

  SongModel({
    required this.artistName,
    required this.trackName,
    required this.artworkUrl100,
    required this.previewURL,
  });

  SongModel.fromJSON(Map<String, dynamic> sMap) {
    artistName = sMap['artistName'] ?? "not available";
    trackName = sMap['trackName'] ?? "not available";
    artworkUrl100 = sMap['artworkURL100'] ?? "not available";
    previewURL = sMap['previewURL'] ?? "not available";
  }
}
