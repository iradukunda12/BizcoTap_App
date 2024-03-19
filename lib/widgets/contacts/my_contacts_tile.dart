import 'package:bizcotap/utils/app_exports.dart';

class MyContactsTile extends StatelessWidget {
  const MyContactsTile({
    super.key,
    required this.data,
    required this.isLastContact,
  });

  final Contact data;
  final bool isLastContact;

  // Function to open the bottom sheet
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      elevation: 10,
      showDragHandle: true,
      builder: (BuildContext context) {
        return const ActionBottomSheet();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                SizedBox(
                  height: getSizeByScreenHeight(context, 7),
                ),
                CircleAvatar(
                  radius: getSizeByScreenWidth(context, 5.5),
                  backgroundColor: AppColors.primary,
                  child: MyText(
                    text: capitalizeInitials(data.name),
                    color: AppColors.light,
                    fontSize: getSizeByScreenWidth(context, 5),
                  ),
                ),
                SizedBox(
                  width: getSizeByScreenWidth(context, 4),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      text: data.name,
                      fontSize: getSizeByScreenWidth(context, 4),
                      fontWeight: FontWeight.w500,
                    ),
                    MyText(
                      text: data.jobPosition,
                      fontSize: getSizeByScreenWidth(context, 3.4),
                      color: AppColors.lighterDark,
                    ),
                  ],
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(AppIcons.dots),
                  onPressed: () {
                    _showBottomSheet(context);
                  },
                  iconSize: getSizeByScreenWidth(context, 8),
                ),
              ],
            ),
            SizedBox(
              height: getSizeByScreenHeight(context, 0.5),
            ),
          ],
        ),
        if (!isLastContact)
          MyDivider(
            width: double.infinity,
            color: AppColors.lighterDark.withOpacity(0.2),
          )
      ],
    );
  }
}
