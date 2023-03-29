part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const home = _Paths.home;
  static const chartImage = _Paths.chartImage;
  static const registration = _Paths.registration;
}

abstract class _Paths {
  _Paths._();

  static const home = '/home';
  static const registration = '/registration';
  static const chartImage = '/chart-image';
}
