import 'package:bizcotap/utils/app_exports.dart';

class ContactCardContent extends StatelessWidget {
  const ContactCardContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildSquareContainer(AppIcons.person),
        SizedBox(
          width: getSizeByScreenWidth(context, 2),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText(
              text: 'All Contacts',
              color: AppColors.light,
              fontWeight: FontWeight.bold,
              fontSize: getSizeByScreenWidth(context, 4.5),
            ),
            MyText(
              text: "${contactsDataList.length} contacts saved",
              color: AppColors.light,
              fontWeight: FontWeight.normal,
              fontSize: getSizeByScreenWidth(context, 3.5),
              lineHeight: 1,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSquareContainer(IconData iconData) {
    return Container(
      width: 50.0,
      height: 50.0,
      decoration: BoxDecoration(
        color: const Color.fromARGB(176, 97, 156, 208),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: const Center(
          child: MySvg(
        assetName: AppConstants.outlinedUserSvg,
      )),
    );
  }
}
