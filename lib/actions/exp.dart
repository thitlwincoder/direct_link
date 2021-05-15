part of direct_link;

class Exp {
  /// facebook url format
  RegExp fb = RegExp(
      '^((https?:)?\/\/)?((?:www|m|fb)\.)?((((?:facebook\.com)|\.watch).*\/(video(s)?|watch|story)(\.php?|\/))|watch).+');

  /// youtube url format
  RegExp yt = RegExp(
      '^((?:https?:)?\/\/)?((?:www|m)\.)?((?:youtube\.com|youtu.be))(\/(?:[\w\-]+\?v=|embed\/|v\/)?)([\w\-]+)');

  /// vimeo url format
  RegExp vi = RegExp('((?:https?:)?\/\/)?(vimeo).+');

  /// dailymotion url format
  RegExp dm = RegExp(
      '^.+dailymotion\.com\/(video|hub)\/([^_]+)[^#]*(#video=([^_&]+))?|(dai\.ly\/([^_]+))');

  /// pcloud url format
  RegExp pc = RegExp('^((?:https?:)?\/\/)?(u\.pcloud\.link).+');

  /// megaup url format
  RegExp mup = RegExp('^((https?:)?\/\/)?((megaup\.)[^\\/,^\\.]{2,})\/.+');

  /// dropbox url format
  RegExp db = RegExp('^((https?:)?\/\/)?((?:www)\.)?((dropbox\.com))\/.+');

  /// solidfiles url format
  RegExp sf = RegExp(
      '^((https?:)?\/\/)?((?:www)\.)?((solidfiles)\.[^\/,^\.]{2,})\/(v)\/.+');

  /// mediafire url format
  RegExp mf =
      RegExp('^((?:https?:)?\/\/)?((?:www)\.)?((mediafire\.com))\/(file)\/.+');

  /// mp4upload url format
  RegExp mu =
      RegExp('((?:https?:)?\/\/)?(www\.)?(mp4upload)\.[^\/,^\.]{2,}\/.+');

  /// gdrive url format
  RegExp gd = RegExp('((?:https?:)?\/\/)?.+(drive\.google\.com).+');

  /// xnxx url format
  RegExp xn = RegExp('((?:https?:)?\/\/)?.+(xnxx).+');

  /// xhamster url format
  RegExp xh = RegExp('((?:https?:)?\/\/)?(xhamster).+');
}
