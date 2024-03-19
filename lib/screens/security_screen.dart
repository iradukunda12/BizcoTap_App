import 'package:bizcotap/utils/app_exports.dart';

class SecurityScreen extends StatelessWidget {
  const SecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MyAppBar(
      title: MyText(
        text: 'Security',
        fontSize: getSizeByScreenWidth(
          context,
          5,
        ),
        color: AppColors.dark,
        fontWeight: FontWeight.w600,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: getSizeByScreenWidth(context, 35),
            width: getSizeByScreenWidth(context, 35),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primary,
            ),
            child: MyIcon(
              icon: Icons.lock_rounded,
              size: getSizeByScreenHeight(context, 8),
              color: AppColors.background,
            ),
          ),
          Padding(
              padding: EdgeInsets.only(
                top: getSizeByScreenHeight(context, 3),
              ),
              child: MyText(
                text: 'Bizcotap protects your privacy',
                fontSize: getSizeByScreenWidth(context, 4.5),
                fontWeight: FontWeight.bold,
              )),
          Padding(
            padding: EdgeInsets.only(
              left: getSizeByScreenWidth(context, 7),
              right: getSizeByScreenWidth(context, 7),
              top: getSizeByScreenHeight(context, 3),
            ),
            child: MyText(
              text: securityData,
              textAlign: TextAlign.justify,
              color: AppColors.lightDark.withOpacity(0.8),
            ),
          ),
          Column(
            children: securityListData.map((security) {
              return Padding(
                padding: EdgeInsets.only(
                  bottom: getSizeByScreenHeight(context, 1),
                  left: getSizeByScreenWidth(context, 7),
                  right: getSizeByScreenWidth(context, 7),
                ),
                child: Row(
                  children: [
                    MyIcon(
                      icon: security.icon,
                      size: getSizeByScreenWidth(context, 7),
                      color: AppColors.lightDark.withOpacity(0.8),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: getSizeByScreenHeight(context, 2),
                      ),
                      child: MyText(
                        text: security.title,
                        color: AppColors.lightDark.withOpacity(0.8),
                      ),
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
