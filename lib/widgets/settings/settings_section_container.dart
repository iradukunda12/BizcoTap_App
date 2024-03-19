import 'package:bizcotap/utils/app_exports.dart';

class SettingsSectionContainer extends StatefulWidget {
  const SettingsSectionContainer({
    super.key,
    required this.section,
  });

  final SettingsSection section;

  @override
  State<SettingsSectionContainer> createState() =>
      _SettingsSectionContainerState();
}

class _SettingsSectionContainerState extends State<SettingsSectionContainer> {
  // switch bool
  late bool _isSwitched;

  @override
  void initState() {
    super.initState();
    _isSwitched = false; // Initialize the switch state
  }

  // onSwitched

  void _onSwitchChanged(bool value) {
    setState(() {
      _isSwitched = value;

      if (_isSwitched &&
          widget.section.items.any((item) => item.routeName == '/create-pin')) {
        Navigator.pushNamed(context, '/create-pin', arguments: _isSwitched);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(
          text: widget.section.title,
          fontSize: getSizeByScreenWidth(context, 4.5),
          fontWeight: FontWeight.bold,
        ),
        SizedBox(height: getSizeByScreenHeight(context, 2)),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.lighterDark.withOpacity(0.05),
          ),
          padding: EdgeInsets.symmetric(
            vertical: getSizeByScreenHeight(context, 1.5),
            horizontal: getSizeByScreenWidth(context, 4),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: widget.section.items.map((item) {
              if (item.routeName == '/notification-settings' ||
                  item.routeName == '/create-pin') {
                return MySwitchWithLabel(
                  onSwitchChanged: _onSwitchChanged,
                  isSwitched: _isSwitched,
                  prefixIcon: MyIcon(icon: item.icon),
                  textWidget: MyText(
                    text: item.label,
                    fontWeight: FontWeight.w500,
                  ),
                );
              }
              return MyTextIconButton(
                  prefixIcon: MyIcon(icon: item.icon),
                  textWidget: MyText(
                    text: item.label,
                    fontWeight: FontWeight.w500,
                  ),
                  iconWidget: (item.routeName != '/login')
                      ? const MyIcon(
                          icon: Icons.arrow_forward_ios,
                          size: 18,
                        )
                      : null,
                  onPressed: () {
                    // Navigate to other routes
                    Navigator.pushNamed(context, item.routeName);
                  });
            }).toList(),
          ),
        ),
        SizedBox(
          height: getSizeByScreenHeight(context, 2),
        ),
      ],
    );
  }
}
