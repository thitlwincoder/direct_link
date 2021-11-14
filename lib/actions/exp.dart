part of direct_link;

class Exp {
  /// facebook url format
  RegExp fb = RegExp(
      r'^((https?:)?\/\/)?((?:www|m|fb)\.)?((((?:facebook\.com)|\.watch).*\/(video(s)?|watch|story)(\.php?|\/))|watch).+');

  /// youtube url format
  RegExp yt = RegExp(
      r'^((?:https?:)?\/\/)?((?:www|m)\.)?((?:youtube\.com|youtu.be))(\/(?:[\w\-]+\?v=|embed\/|v\/)?)([\w\-]+)');

  /// vimeo url format
  RegExp vi = RegExp(r'((?:https?:)?\/\/)?(vimeo).+');

  /// dailymotion url format
  RegExp dm = RegExp(
      r'^.+dailymotion\.com\/(video|hub)\/([^_]+)[^#]*(#video=([^_&]+))?|(dai\.ly\/([^_]+))');

  /// pcloud url format
  RegExp pc = RegExp(r'^((?:https?:)?\/\/)?(u\.pcloud\.link).+');

  /// megaup url format
  RegExp mup = RegExp(r'^((https?:)?\/\/)?((megaup\.)[^\\/,^\\.]{2,})\/.+');

  /// dropbox url format
  RegExp db = RegExp(r'^((https?:)?\/\/)?((?:www)\.)?((dropbox\.com))\/.+');

  /// solidfiles url format
  RegExp sf = RegExp(
      r'^((https?:)?\/\/)?((?:www)\.)?((solidfiles)\.[^\/,^\.]{2,})\/(v)\/.+');

  /// mediafire url format
  RegExp mf =
      RegExp(r'^((?:https?:)?\/\/)?((?:www)\.)?((mediafire\.com))\/(file)\/.+');

  /// mp4upload url format
  RegExp mu =
      RegExp(r'((?:https?:)?\/\/)?(www\.)?(mp4upload)\.[^\/,^\.]{2,}\/.+');

  /// gdrive url format
  RegExp gd = RegExp(r'((?:https?:)?\/\/)?.+(drive\.google\.com).+');

  /// xnxx url format
  RegExp xn = RegExp(r'((?:https?:)?\/\/)?.+(xnxx).+');

  /// xhamster url format
  RegExp xh = RegExp(r'((?:https?:)?\/\/)?(xhamster).+');

  /// instagram url format
  RegExp inst = RegExp(
      r'(?:(?:http|https):\/\/)?(?:www.)?(?:instagram.com|instagr.am|instagr.com)\/(\w+)');

  /// imdb url format
  RegExp imdb = RegExp(r'(http:\/\/www.|https:\/\/www.)imdb.com\/video\/.*');
}
