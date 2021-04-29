part of direct_link;

class Exp {
  /// facebook url format
  RegExp fb = RegExp(
      '^((https?:)?\/\/)?((?:www|m|fb)\.)?((((?:facebook\.com)|\.watch).*\/(video(s)?|watch|story)(\.php?|\/))|watch).+');

  /// youtube url format
  RegExp yt = RegExp(
      '^((?:https?:)?\/\/)?((?:www|m)\.)?((?:youtube\.com|youtu.be))(\/(?:[\w\-]+\?v=|embed\/|v\/)?)([\w\-]+)');
}
