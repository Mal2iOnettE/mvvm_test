class Constants {
  static String Top_Head_Lines = "https://newsapi.org/v2/top-headlines?country=us&apiKey=81bcc286322649509d27ca960a112753";

  static String headLinesFor(String keyword) {
    return "https://newsapi.org/v2/top-headlines?q=$keyword&apiKey=81bcc286322649509d27ca960a112753";
  }
}
