part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const home = _Paths.home;
  static const chatImage = _Paths.chatImage;
  static const chatText = _Paths.chatText;
}

abstract class _Paths {
  _Paths._();

  static const home = '/home';
  static const chatImage = '/chat-image';
  static const chatText = '/chat-text';
}
