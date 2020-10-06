class Exp {
  RegExp fb = RegExp(
      "^((https?:)?\/\/)?((?:www|m)\.)?((?:facebook\.com))*\/(video(s)?|watch|story)(\.php?|\/).+\$");

  RegExp yt = RegExp(
      "^((?:https?:)?\/\/)?((?:www|m)\.)?((?:youtube\.com|youtu.be))(\/(?:[\w\-]+\?v=|embed\/|v\/)?)([\w\-]+)");

  RegExp mf =
      RegExp("^((?:https?:)?\/\/)?((?:www)\.)?((mediafire\.com))\/(file)\/.+");

  RegExp mup = RegExp("^((https?:)?\/\/)?((megaup\.)[^\\/,^\\.]{2,})\/.+");

  RegExp db = RegExp("^((https?:)?\/\/)?((?:www)\.)?((dropbox\.com))\/.+");

  RegExp sf = RegExp(
      "^((https?:)?\/\/)?((?:www)\.)?((solidfiles)\.[^\/,^\.]{2,})\/(v)\/.+");

  RegExp pc = RegExp(
      "^((https?:)?\/\/)?((u\.pcloud\.link)\/)?((publink)\/)?((show)\?)code=.+");
}
