import 'package:bizcotap/utils/app_exports.dart';
import 'package:bizcotap/utils/url_launcher.dart';

class PreviewScreen extends StatefulWidget {
  const PreviewScreen({super.key});

  @override
  State<PreviewScreen> createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
  void sendMessage() {
    String phoneNumber = '+250781882297';
    String messageBody = 'Hello! This is a test message.';
    launchSMS(phoneNumber, messageBody);
  }

  @override
  Widget build(BuildContext context) {
    return MyAppBar(
      title: MyText(
        text: 'Preview',
        fontSize: getSizeByScreenWidth(
          context,
          5,
        ),
        color: AppColors.dark,
        fontWeight: FontWeight.w600,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getSizeByScreenWidth(context, 5)),
                  child: Container(
                    height: getSizeByScreenHeight(context, 23),
                    decoration: const BoxDecoration(
                      color: AppColors.tertiary,
                      borderRadius: BorderRadiusDirectional.only(
                        bottomEnd: Radius.circular(20),
                        bottomStart: Radius.circular(20),
                      ),
                    ),
                    child: Transform.translate(
                      offset: const Offset(0, -35),
                      child: Center(
                        child: MySizedBox(
                            width: 30, child: Image.asset(AppConstants.logo)),
                      ),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: const Offset(140, 115),
                  child: Container(
                    width: getSizeByScreenHeight(context, 16),
                    height: getSizeByScreenHeight(context, 16),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.background,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: CircleAvatar(
                        backgroundColor: AppColors.tertiary,
                        radius: getSizeByScreenHeight(context, 7),
                        child: MyText(
                          text: capitalizeInitials('t'),
                          fontSize: 40,
                          color: AppColors.background,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                const MySizedBox(
                  height: 8,
                ),
                const MyText(
                  text: 'United States of america',
                  color: AppColors.tertiary,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                const MySizedBox(
                  height: 0.5,
                ),
                MyText(
                  text: 'Bizcotap Ltd',
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: AppColors.lightDark.withOpacity(0.8),
                ),
                const MyText(
                  text: 'Mobile Developer',
                  fontSize: 15,
                ),
              ],
            ),
            const MySizedBox(
              height: 3,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: getSizeByScreenWidth(context, 6),
              ),
              child: Row(
                children: [
                  MySizedBox(
                    width: 43,
                    height: 7,
                    child: OutlinedButton(
                      style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(AppColors.primary),
                      ),
                      onPressed: () {},
                      child: Row(
                        children: [
                          const MySizedBox(
                            width: 3,
                          ),
                          Image.asset(AppConstants.exchangeIcon),
                          MySizedBox(
                            width: getSizeByScreenWidth(context, 0.5),
                          ),
                          const MyText(
                            text: 'Exchange ',
                            color: AppColors.background,
                            fontSize: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const MySizedBox(
                    width: 4,
                  ),
                  MySizedBox(
                    width: 43,
                    height: 7,
                    child: OutlinedButton(
                      style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(AppColors.primary),
                      ),
                      onPressed: () {},
                      child: Row(
                        children: [
                          Image.asset(AppConstants.savecontactIcon),
                          MySizedBox(
                            width: getSizeByScreenWidth(context, 0.5),
                          ),
                          const MyText(
                            text: 'Save Contact',
                            color: AppColors.background,
                            fontSize: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Transform.translate(
                  offset: const Offset(40, 30),
                  child: Column(
                    children: [
                      InkWell(
                        overlayColor:
                            const MaterialStatePropertyAll(Colors.transparent),
                        onTap: sendMessage,
                        child: Image.asset(AppConstants.imessageIcon),
                      ),
                      const MyText(
                        text: 'Messages',
                      )
                    ],
                  ),
                ),
                Transform.translate(
                  offset: const Offset(90, 30),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          emailLauncher(
                              'content', 'subject', 'taylor@gmail.com');
                        },
                        overlayColor:
                            const MaterialStatePropertyAll(Colors.transparent),
                        child: Image.asset(AppConstants.messageIcon),
                      ),
                      const MyText(
                        text: 'Mail',
                      )
                    ],
                  ),
                ),
                Transform.translate(
                  offset: const Offset(140, 30),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          openWhatsApp('0781882297');
                        },
                        overlayColor:
                            const MaterialStatePropertyAll(Colors.transparent),
                        child: Image.asset(AppConstants.whatsappIcon),
                      ),
                      const MyText(
                        text: 'Whatsapp',
                      )
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Transform.translate(
                  offset: const Offset(40, 50),
                  child: Column(
                    children: [
                      InkWell(
                        overlayColor:
                            const MaterialStatePropertyAll(Colors.transparent),
                        onTap: () {
                          openLink("https://twitter.com/bizcotap");
                        },
                        child: Image.asset(AppConstants.xIcon),
                      ),
                      const MyText(
                        text: 'X',
                      )
                    ],
                  ),
                ),
                Transform.translate(
                  offset: const Offset(87, 50),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          openLink(
                              'https://www.linkedin.com/in/masezerano-paul-a71b2a21a/');
                        },
                        overlayColor:
                            const MaterialStatePropertyAll(Colors.transparent),
                        child: Image.asset(AppConstants.linkedinIcon),
                      ),
                      const MyText(
                        text: 'Linked In',
                      )
                    ],
                  ),
                ),
                Transform.translate(
                  offset: const Offset(134, 50),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          openLink('https://www.instagram.com/bizcotap/');
                        },
                        overlayColor:
                            const MaterialStatePropertyAll(Colors.transparent),
                        child: Image.asset(AppConstants.instagramIcon),
                      ),
                      const MyText(
                        text: 'Instagram',
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
