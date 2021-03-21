class Exp {
  /// facebook  url format
  RegExp fb = RegExp(
      "^((https?:)?\/\/)?((?:www|m)\.)?((?:facebook\.com))*\/(video(s)?|watch|story)(\.php?|\/).+\$");

  /// youtube url format
  RegExp yt = RegExp(
      "^((?:https?:)?\/\/)?((?:www|m)\.)?((?:youtube\.com|youtu.be))(\/(?:[\w\-]+\?v=|embed\/|v\/)?)([\w\-]+)");

  /// mediafire url format
  RegExp mf =
      RegExp("^((?:https?:)?\/\/)?((?:www)\.)?((mediafire\.com))\/(file)\/.+");

  /// megaup url format
  RegExp mup = RegExp("^((https?:)?\/\/)?((megaup\.)[^\\/,^\\.]{2,})\/.+");

  /// dropbox url format
  RegExp db = RegExp("^((https?:)?\/\/)?((?:www)\.)?((dropbox\.com))\/.+");

  /// solidfiles url format
  RegExp sf = RegExp(
      "^((https?:)?\/\/)?((?:www)\.)?((solidfiles)\.[^\/,^\.]{2,})\/(v)\/.+");

  /// pcloud url format
  RegExp pc = RegExp("^((?:https?:)?\/\/)?(u\.pcloud\.link).+");

  /// dailymotion url format
  RegExp dm = RegExp(
      "^.+dailymotion\.com\/(video|hub)\/([^_]+)[^#]*(#video=([^_&]+))?|(dai\.ly\/([^_]+))");

  /// twitter url format
  RegExp tt =
      RegExp("^http(?:s)?:\/\/(?:www\.)?twitter\.com\/([a-zA-Z0-9_]).+");

  /// pornhub url format
  RegExp ph = RegExp("((?:https?:)?\/\/)?.+(pornhub).+");

  /// gdrive url format
  RegExp gd = RegExp("((?:https?:)?\/\/)?.+(drive\.google\.com).+");

  /// xnxx url format
  RegExp xn = RegExp("((?:https?:)?\/\/)?.+(xnxx).+");

  /// xhamster url format
  RegExp xh = RegExp("((?:https?:)?\/\/)?(xhamster).+");

  /// vimeo url format
  RegExp vi = RegExp("((?:https?:)?\/\/)?(vimeo).+");

  /// mp4upload url format
  RegExp mu =
      RegExp("((?:https?:)?\/\/)?(www\.)?(mp4upload)\.[^\/,^\.]{2,}\/.+");
}
