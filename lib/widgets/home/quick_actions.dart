import 'package:bizcotap/utils/app_exports.dart';

class QuickActions extends StatelessWidget {
  const QuickActions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: getSizeByScreenWidth(context, 6),
          right: getSizeByScreenWidth(context, 6),
          top: getSizeByScreenHeight(context, 1)),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
            text: 'Quick Actions',
            fontSize: getSizeByScreenWidth(context, 4),
            color: AppColors.dark,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(
            height: getSizeByScreenHeight(context, 2),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: quickActionsListData.map((quickAction) {
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, quickAction.route);
                },
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(
                        getSizeByScreenWidth(context, 3.5),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primary.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 10,
                              blurStyle: BlurStyle.outer,
                            )
                          ]),
                      child: MySvg(
                        assetName: quickAction.icon,
                      ),
                    ),
                    SizedBox(
                      height: getSizeByScreenHeight(context, 1),
                    ),
                    MyText(
                      text: quickAction.title,
                      fontSize: getSizeByScreenWidth(context, 3.5),
                    ),
                  ],
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
