import 'package:bizcotap/utils/app_exports.dart';

class HelpAndSupportTile extends StatelessWidget {
  const HelpAndSupportTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: dummyDataList.map((data) {
        return Container(
          margin: EdgeInsets.only(
            bottom: getSizeByScreenHeight(context, 4),
          ),
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, data.route);
            },
            borderRadius:
                BorderRadius.circular(getSizeByScreenHeight(context, 2.5)),
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: getSizeByScreenHeight(context, 2.5),
                horizontal: getSizeByScreenWidth(context, 3),
              ),
              decoration: BoxDecoration(
                color: AppColors.lighterDark.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  MyImage(
                    imagePath: data.imagePath,
                    height: getSizeByScreenWidth(context, 16),
                    width: getSizeByScreenWidth(context, 20),
                    fit: BoxFit.contain,
                  ),
                  SizedBox(
                    width: getSizeByScreenWidth(context, 8),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                        text: data.title,
                        fontWeight: FontWeight.w600,
                        fontSize: getSizeByScreenHeight(context, 2.2),
                      ),
                      MyText(
                        text: data.subtitle,
                        fontSize: getSizeByScreenHeight(context, 1.9),
                        color: AppColors.lighterDark.withOpacity(0.9),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
