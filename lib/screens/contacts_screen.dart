import 'package:bizcotap/utils/app_exports.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
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
    return Future.delayed(const Duration(seconds: 5));
  }

  @override
  Widget build(BuildContext context) {
    return MyAppBar(
      title: MyText(
        text: 'Contacts',
        fontSize: getSizeByScreenWidth(context, 5.5),
        color: AppColors.dark,
        fontWeight: FontWeight.w800,
      ),
      centerTitle: false,
      actions: const [NotificationAction()],
      body: RefreshIndicator(
        color: AppColors.primary,
        onRefresh: _refresh,
        child: Column(
          children: [
            const MySizedBox(
              height: 1,
            ),
            MySearchInput(
              searchController: searchController,
              onSearch: searchContacts,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getSizeByScreenWidth(context, 5),
                  vertical: getSizeByScreenHeight(context, 2)),
              child: MyCardWithPatterns(
                contentWidget: const ContactCardContent(),
                icon: AppIcons.open,
                iconSize: 20,
                tooltip: 'Export Contacts',
                onPressed: () {
                  Navigator.pushNamed(context, '/export-contacts');
                },
                backgroundColor: AppColors.light,
              ),
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
            )
          ],
        ),
      ),
    );
  }
}
