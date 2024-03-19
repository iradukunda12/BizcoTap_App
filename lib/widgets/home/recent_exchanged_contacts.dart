import 'package:bizcotap/utils/app_exports.dart';
import 'package:bizcotap/widgets/home/recent_exchanged_contact_card.dart';

class RecentExchangedContacts extends StatelessWidget {
  const RecentExchangedContacts({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(
          top: getSizeByScreenHeight(context, 2),
          left: getSizeByScreenWidth(context, 6),
          right: getSizeByScreenWidth(context, 6),
        ),
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            SizedBox(
              height: getSizeByScreenHeight(context, 17),
              child: _buildContactList(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MyText(
          text: 'Exchanged Contacts',
          fontSize: getSizeByScreenWidth(context, 4),
          color: AppColors.dark,
          fontWeight: FontWeight.w600,
        ),
        MyTextIconButton(
          textWidget: MyText(
            text: 'See all',
            fontSize: getSizeByScreenWidth(context, 4),
          ),
          iconWidget: MyIcon(
            icon: Icons.arrow_forward_ios,
            size: getSizeByScreenWidth(context, 3.5),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/exchanged-contacts');
          },
        )
      ],
    );
  }

  Widget _buildContactList(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemExtent: getSizeByScreenWidth(context, 32),
      itemBuilder: (context, index) {
        return RecentExchangedContactCard(
          data: contactsDataList[index],
        );
      },
    );
  }
}
