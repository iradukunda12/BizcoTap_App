import 'package:bizcotap/utils/app_exports.dart';

class QuickAction {
  final String title;
  final String icon;
  final String route;

  QuickAction({
    required this.title,
    required this.icon,
    required this.route,
  });
}

List<QuickAction> quickActionsListData = [
  QuickAction(
    title: 'Analytics',
    icon: AppConstants.analyticsSvg,
    route: "/analytics",
  ),
  QuickAction(
    title: 'Share',
    icon: AppConstants.shareSvg,
    route: "/share",
  ),
  QuickAction(
    title: 'Email Sign',
    icon: AppConstants.emailSignatureSvg,
    route: "/email-signature",
  ),
  QuickAction(
    title: 'Preview',
    icon: AppConstants.previewSvg,
    route: "/preview",
  ),
];
