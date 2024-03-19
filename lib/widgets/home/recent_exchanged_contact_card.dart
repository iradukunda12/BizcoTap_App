import 'package:bizcotap/utils/app_exports.dart';
import 'package:bizcotap/utils/truncate_string.dart';

class RecentExchangedContactCard extends StatefulWidget {
  const RecentExchangedContactCard({
    super.key,
    required this.data,
  });

  final Contact data;

  @override
  State<RecentExchangedContactCard> createState() =>
      _RecentExchangedContactCardState();
}

class _RecentExchangedContactCardState
    extends State<RecentExchangedContactCard> {
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: getSizeByScreenWidth(context, 1.5)),
      decoration: BoxDecoration(
          border: Border.all(
            width: 1.2,
            color: AppColors.primary.withOpacity(0.2),
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              blurStyle: BlurStyle.outer,
            )
          ]),
      child: buildCardContent(context),
    );
  }

  Widget buildCardContent(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: getSizeByScreenWidth(context, 6),
          backgroundColor: AppColors.primary,
          child: MyText(
            text: capitalizeInitials(widget.data.name),
            color: AppColors.light,
            fontSize: getSizeByScreenWidth(context, 5),
          ),
        ),
        const MySizedBox(height: 1),
        MyText(
          text: truncateString(widget.data.name, 10),
          textAlign: TextAlign.center,
          fontSize: getSizeByScreenWidth(context, 3.5),
          fontWeight: FontWeight.w500,
          color: AppColors.lightDark,
        ),
        MyOutlinedButton(
          onPressed: () {
            _makePhoneCall('0781882297');
          },
          width: getSizeByScreenWidth(context, 7),
          height: getSizeByScreenHeight(context, 1.8),
          borderRadius: 25,
          text: MyText(
            text: 'Call',
            fontSize: getSizeByScreenWidth(context, 3.5),
            color: AppColors.primary,
          ),
          buttonColor: MaterialStatePropertyAll(
            AppColors.primary.withOpacity(0.1),
          ),
        )
      ],
    );
  }
}
