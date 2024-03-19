import 'package:bizcotap/utils/app_exports.dart';

class ExchangedContactsScreen extends StatefulWidget {
  const ExchangedContactsScreen({super.key});

  @override
  State<ExchangedContactsScreen> createState() =>
      _ExchangedContactsScreenState();
}

class _ExchangedContactsScreenState extends State<ExchangedContactsScreen> {
  final TextEditingController searchController = TextEditingController();
  List<Contact> searchedContacts = contactsDataList;

  void searchContacts(String query) {
    setState(() {
      searchedContacts = contactsDataList
          .where((contact) =>
              contact.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  Future<void> _refresh() {
    return Future.delayed(
      const Duration(seconds: 5),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MyAppBar(
      title: MyText(
        text: 'Exchanged Contacts',
        fontSize: getSizeByScreenWidth(
          context,
          5,
        ),
        color: AppColors.dark,
        fontWeight: FontWeight.w600,
      ),
      centerTitle: false,
      actions: const [
        NotificationAction(),
      ],
      body: RefreshIndicator(
        color: AppColors.primary,
        onRefresh: _refresh,
        child: Column(
          children: [
            MySearchInput(
              searchController: searchController,
              onSearch: searchContacts,
            ),
            const MySizedBox(
              height: 1,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: searchedContacts.length,
                itemBuilder: (context, index) {
                  bool isLastContact = index == searchedContacts.length - 1;
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: getSizeByScreenWidth(context, 5),
                    ),
                    child: MyContactsTile(
                      data: searchedContacts[index],
                      isLastContact: isLastContact,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
