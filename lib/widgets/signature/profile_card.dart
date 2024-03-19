import 'package:bizcotap/utils/app_exports.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          width: getSizeByScreenWidth(context, 60),
          padding: EdgeInsets.symmetric(
            vertical: getSizeByScreenHeight(context, 3),
            horizontal: getSizeByScreenWidth(context, 3),
          ),
          decoration: BoxDecoration(
            color: AppColors.lighterDark.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: 2,
              color: AppColors.lighterDark.withOpacity(0.1),
            ),
          ),
          child: Column(
            children: [
              const MySizedBox(height: 2),
              const MySvg(
                assetName: AppConstants.qrCodeSvg,
              ),
              const MySizedBox(height: 2),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: getSizeByScreenHeight(context, 2),
                  horizontal: getSizeByScreenWidth(context, 11),
                ),
                decoration: BoxDecoration(
                  color: AppColors.lightDark.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    MyText(
                      text: tags[0].name,
                      color: AppColors.light,
                      fontWeight: FontWeight.bold,
                      fontSize: getSizeByScreenWidth(context, 4.2),
                    ),
                    MyText(
                      text: tags[0].company.name,
                      color: AppColors.light,
                      fontSize: getSizeByScreenWidth(context, 3),
                    ),
                    MyText(
                      text: tags[0].position,
                      color: AppColors.light,
                      fontSize: getSizeByScreenWidth(context, 3),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Transform.translate(
          offset: const Offset(0, -30),
          child: CircleAvatar(
            backgroundColor: AppColors.primary,
            radius: getSizeByScreenWidth(
              context,
              8,
            ),
            child: MyText(
              text: capitalizeInitials(tags[0].name),
              color: AppColors.light,
              fontWeight: FontWeight.bold,
              fontSize: getSizeByScreenWidth(
                context,
                5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
