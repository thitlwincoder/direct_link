class Exp {
  RegExp fb = RegExp(
      "^((https?:)?\/\/)?((?:www|m)\.)?((?:facebook\.com))*\/(video(s)?|watch|story)(\.php?|\/).+\$");

  RegExp yt = RegExp(
      "^((?:https?:)?\/\/)?((?:www|m)\.)?((?:youtube\.com|youtu.be))(\/(?:[\w\-]+\?v=|embed\/|v\/)?)([\w\-]+)");
}
