import 'package:bizcotap/utils/app_exports.dart';

class MySwitchWithLabel extends StatefulWidget {
  const MySwitchWithLabel({
    super.key,
    required this.prefixIcon,
    required this.textWidget,
    required this.isSwitched,
    required this.onSwitchChanged,
  });

  final Widget prefixIcon;
  final Widget textWidget;
  final bool isSwitched;
  final ValueChanged<bool> onSwitchChanged;

  @override
  State<MySwitchWithLabel> createState() => _MySwitchWithLabelState();
}

class _MySwitchWithLabelState extends State<MySwitchWithLabel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: getSizeByScreenWidth(context, 3)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              widget.prefixIcon,
              const MySizedBox(
                width: 2,
              ),
              widget.textWidget,
            ],
          ),
          Switch(
            onChanged: widget.onSwitchChanged,
            value: widget.isSwitched,
            activeColor: AppColors.light,
            activeTrackColor: AppColors.primary,
            inactiveThumbColor: AppColors.light,
            inactiveTrackColor: AppColors.lighterDark.withOpacity(0.5),
          ),
        ],
      ),
    );
  }
}
