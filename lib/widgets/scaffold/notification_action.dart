import 'package:bizcotap/utils/app_exports.dart';

class NotificationAction extends StatelessWidget {
  const NotificationAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MyIconButton(
          icon: AppIcons.notifications,
          tooltip: AppConstants.notifications,
          onPressed: () {
            Navigator.pushNamed(context, '/edit-header');
          },
          iconColor: AppColors.dark,
        ),
        Positioned(
          top: 18,
          left: 26,
          child: Container(
            width: 10,
            height: 10,
            decoration: const BoxDecoration(
              color: AppColors.light,
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          top: 19,
          left: 27,
          child: Container(
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
              color: AppColors.danger,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }
}
