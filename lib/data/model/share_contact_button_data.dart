import 'package:bizcotap/utils/app_exports.dart';

class SocialShareButtonContent {
  final String label;
  final String svg;
  final String type;

  SocialShareButtonContent({
    required this.label,
    required this.svg,
    required this.type,
  });
}

List<SocialShareButtonContent> shareButtonListData = [
  SocialShareButtonContent(
      label: 'Share contact via LinkedIn',
      svg: AppConstants.linkedinSvg,
      type: 'linkedin'),
  SocialShareButtonContent(
      label: 'Share contact via Instagram',
      svg: AppConstants.instagramSvg,
      type: 'instagram'),
  SocialShareButtonContent(
      label: 'Share contact via Twitter',
      svg: AppConstants.twitterSvg,
      type: 'twitter'),
  SocialShareButtonContent(
      label: 'Share contact via Whatsaap',
      svg: AppConstants.whatsappSvg,
      type: 'whatsapp'),
];
