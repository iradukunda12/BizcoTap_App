import 'package:bizcotap/utils/app_exports.dart';

class ImportButtons extends StatelessWidget {
  const ImportButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: importButtonListData.map((item) {
        final isLastButton = item == importButtonListData.last;
        return Column(
          children: [
            MyImportButton(
              onPressed: () {},
              text: MyText(
                text: item.label,
                fontSize: getSizeByScreenWidth(
                  context,
                  4.5,
                ),
                color: AppColors.lightDark,
              ),
              icon: MySvg(
                assetName: item.svg,
              ),
              buttonColor: MaterialStateProperty.all(
                AppColors.lighterDark.withOpacity(0.2),
              ),
            ),
            if (!isLastButton) const MySizedBox(height: 1),
          ],
        );
      }).toList(),
    );
  }
}
