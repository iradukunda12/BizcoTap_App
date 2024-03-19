import 'package:bizcotap/utils/app_exports.dart';

class MySlide extends StatelessWidget {
  const MySlide({
    super.key,
    required this.data,
  });

  final SlideData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0XFF005097),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: getSizeByScreenHeight(context, 13)),
            child: MyImage(
              imagePath: data.imagePath,
              height: getSizeByScreenHeight(
                context,
                48,
              ),
              width: double.infinity,
            ),
          ),
          Container(
            color: AppColors.primary,
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(getSizeByScreenHeight(
                  context,
                  4,
                )),
                child: Column(
                  children: [
                    MyText(
                      text: data.title,
                      color: Colors.white,
                      fontSize: getSizeByScreenWidth(context, 8),
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: getSizeByScreenHeight(
                        context,
                        3,
                      ), // Adjust as needed
                    ),
                    MyText(
                      text: data.description,
                      color: AppColors.light,
                      fontSize: getSizeByScreenWidth(context, 3.5),
                      fontWeight: FontWeight.normal,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
