import 'package:flutter_dotenv/flutter_dotenv.dart';

class HardCode {
  static const images = _Images();
  static const networkImages = _NetworkImages();
  static final env = _Env();
}

class _Images {
  final loadingGif = 'assets/images/giphy.gif';
  final noImagePng = 'assets/images/no-image.png';

  const _Images();
}

class _NetworkImages {
  // final placeholder400x300f6f6f6 = 'https://via.placeholder.com/400x300/f6f6f6';
  // final placeholder400x300Green = 'https://via.placeholder.com/400x300/green';
  const _NetworkImages();
}

class _Env {
  final apiKey = dotenv.env['apiKey'];
}
