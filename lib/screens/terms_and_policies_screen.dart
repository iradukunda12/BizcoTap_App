import 'package:bizcotap/utils/app_exports.dart';

class TermsAndPoliciesScreen extends StatefulWidget {
  const TermsAndPoliciesScreen({super.key});

  @override
  State<TermsAndPoliciesScreen> createState() => _TermsAndPoliciesScreenState();
}

class _TermsAndPoliciesScreenState extends State<TermsAndPoliciesScreen> {
  final Uri _url = Uri.parse('https://bizcotap.com/privacy');
  final ScrollController _scrollController = ScrollController();
  bool isScrolling = false;
  bool isScrolledToBottom = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_checkIfScrolling);
  }

  void _checkIfScrolling() {
    if (_scrollController.hasClients && _scrollController.offset > 0) {
      setState(() {
        isScrolling = true;
      });
    } else {
      setState(() {
        isScrolling = false;
      });
    }

    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      setState(() {
        isScrolledToBottom = true;
      });
    } else {
      setState(() {
        isScrolledToBottom = false;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  bool onNotication(notification) {
    if (notification is ScrollEndNotification) {
      _checkIfScrolling();
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return MyAppBar(
      elevation: 5,
      shadowColor:
          isScrolling ? AppColors.primary.withOpacity(0.2) : Colors.transparent,
      title: MyText(
        text: 'Terms & Policies',
        fontSize: getSizeByScreenWidth(
          context,
          5,
        ),
        color: AppColors.dark,
        fontWeight: FontWeight.w600,
      ),
      body: Column(children: [
        Expanded(
          child: NotificationListener(
            onNotification: onNotication,
            child: Markdown(
              padding: EdgeInsets.all(
                getSizeByScreenWidth(context, 5),
              ),
              data: termsAndPoliciesContent,
              controller: _scrollController,
              styleSheet: MarkdownStyleSheet(
                h2: TextStyle(
                  fontFamily: 'SofiaFont',
                  fontSize: getSizeByScreenWidth(context, 4.8),
                  fontWeight: FontWeight.bold,
                ),
                h3: TextStyle(
                  fontFamily: 'SofiaFont',
                  fontSize: getSizeByScreenWidth(context, 4),
                  fontWeight: FontWeight.bold,
                ),
                p: TextStyle(
                  fontFamily: 'SofiaFont',
                  fontSize: getSizeByScreenWidth(context, 4),
                ),
              ),
            ),
          ),
        ),
        Builder(
          builder: (context) {
            return Padding(
              padding: EdgeInsets.only(
                top: getSizeByScreenHeight(context, 2),
                bottom: getSizeByScreenHeight(context, 2),
                left: getSizeByScreenWidth(context, 4),
                right: getSizeByScreenWidth(context, 4),
              ),
              child: MyOutlinedButton(
                onPressed: isScrolledToBottom ? _launchUrl : null,
                text: const MyText(
                  text: 'Read More',
                  color: AppColors.light,
                ),
                buttonColor: MaterialStateProperty.all(
                  isScrolledToBottom
                      ? AppColors.primary
                      : AppColors.lighterDark.withOpacity(0.5),
                ),
              ),
            );
          },
        )
      ]),
    );
  }
}
