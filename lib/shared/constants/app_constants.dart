import 'dart:math';

class AppConstants {
  static const appName = "Gigtrybe";
  // static const mockAssetImage = 'assets/photo.avif';
  // static const mockImage =
  //     "https://images.unsplash.com/photo-1607345366928-199ea26cfe3e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80";
  // "https://www.bing.com/th?id=OIP.Sa9ZfKEPzreh38i8xrwQJgHaEo&w=316&h=197&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2";
  static const mockTestsImage =
      "https://valhala-stg.s3.eu-west-2.amazonaws.com/avatar/woman-graduating-with-certificate-avatar-character-vector-25010708.jpg";

  static String get mockAssetImage =>
      ['assets/photo.avif', 'assets/photo2.avif'][Random().nextInt(2)];
}
