class Exp {
  // facebook url format
  RegExp fb = RegExp(
      "^((https?:)?\/\/)?((?:www|m)\.)?((?:facebook\.com))*\/(video(s)?|watch|story)(\.php?|\/).+\$");

  // youtube url format
  RegExp yt = RegExp(
      "^((?:https?:)?\/\/)?((?:www|m)\.)?((?:youtube\.com|youtu.be))(\/(?:[\w\-]+\?v=|embed\/|v\/)?)([\w\-]+)");

  // mediafire url format
  RegExp mf =
      RegExp("^((?:https?:)?\/\/)?((?:www)\.)?((mediafire\.com))\/(file)\/.+");

  // megaup url format
  RegExp mup = RegExp("^((https?:)?\/\/)?((megaup\.)[^\\/,^\\.]{2,})\/.+");

  // dropbox url format
  RegExp db = RegExp("^((https?:)?\/\/)?((?:www)\.)?((dropbox\.com))\/.+");

  // solidfiles url format
  RegExp sf = RegExp(
      "^((https?:)?\/\/)?((?:www)\.)?((solidfiles)\.[^\/,^\.]{2,})\/(v)\/.+");

  // pcloud url format
  RegExp pc = RegExp(
      "^((https?:)?\/\/)?((u\.pcloud\.link)\/)?((publink)\/)?((show)\?)code=.+");
}
