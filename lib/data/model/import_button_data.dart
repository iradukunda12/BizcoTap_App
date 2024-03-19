import 'package:bizcotap/utils/app_exports.dart';

class ImportButton {
  final String label;
  final String svg;

  ImportButton({
    required this.label,
    required this.svg,
  });
}

List<ImportButton> importButtonListData = [
  ImportButton(
    label: 'Import signature to Gmail ',
    svg: AppConstants.gmailSvg,
  ),
  ImportButton(
    label: 'Import signature to Outlook ',
    svg: AppConstants.outlookSvg,
  ),
  ImportButton(
    label: 'Copy HTML code',
    svg: AppConstants.htmlSvg,
  ),
];
