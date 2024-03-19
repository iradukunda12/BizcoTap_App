import 'package:bizcotap/utils/app_exports.dart';

class SlideData {
  final String imagePath;
  final String title;
  final String description;

  SlideData({
    required this.imagePath,
    required this.title,
    required this.description,
  });
}

final List<SlideData> slideDataList = [
  SlideData(
    imagePath: AppConstants.slideImage1,
    title: 'Share all your Digital Business Cards Easily',
    description:
        'Lorem ipsum dolor sit amet consectetur. Uterestere vulputate diam nil aliqut aliqaum etiam veliterses',
  ),
  SlideData(
    imagePath: AppConstants.slideImage2,
    title: 'Connect and Manage your Bizcotap Devices',
    description:
        'Lorem ipsum dolor sit amet consectetur. Uterestere vulputate diam nil aliqut aliqaum etiam veliterses',
  ),
  SlideData(
    imagePath: AppConstants.slideImage3,
    title: 'Seamless Connection at your Finger Tips',
    description:
        'Lorem ipsum dolor sit amet consectetur. Uterestere vulputate diam nil aliqut aliqaum etiam veliterses',
  ),
];
