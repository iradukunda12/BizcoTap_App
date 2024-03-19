import 'package:bizcotap/utils/app_exports.dart';
import 'package:bizcotap/widgets/analytics/graph.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  List<int> years =
      List.generate(30, (index) => 2022 + index); // Generate a list of years

  int selectedYear = DateTime.now().year; // Default selected year

  @override
  Widget build(BuildContext context) {
    return MyAppBar(
      title: MyText(
        text: 'Analytics',
        fontSize: getSizeByScreenWidth(
          context,
          5,
        ),
        color: AppColors.dark,
        fontWeight: FontWeight.w600,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding:
                    EdgeInsets.only(left: getSizeByScreenWidth(context, 8)),
                child: const MyText(
                  text: 'Overview',
                  fontWeight: FontWeight.bold,
                ),
              ),
              const MySizedBox(
                width: 50,
              ),
              DropdownButton<int>(
                value: selectedYear,
                onChanged: (int? newValue) {
                  setState(() {
                    selectedYear = newValue!;
                  });
                },
                dropdownColor: AppColors.background,
                elevation: 15,
                menuMaxHeight: getSizeByScreenHeight(context, 30),
                items: years.map<DropdownMenuItem<int>>((int value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: MyText(
                      text: value.toString(),
                      fontWeight: FontWeight.bold,
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: getSizeByScreenWidth(context, 2),
                ),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withOpacity(0.05),
                          spreadRadius: 1,
                          blurRadius: 5,
                          blurStyle: BlurStyle.outer,
                        ),
                      ]),
                  child: Card(
                    elevation: getSizeByScreenWidth(context, 0),
                    color: AppColors.background,
                    surfaceTintColor: Colors.transparent,
                    shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(3),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: getSizeByScreenWidth(context, 3),
                        vertical: getSizeByScreenHeight(context, 1.5),
                      ),
                      child: Row(
                        children: [
                          const Image(
                            image: AssetImage(AppConstants.nfcTap),
                          ),
                          MySizedBox(
                            width: getSizeByScreenWidth(context, 2),
                          ),
                          Column(
                            children: [
                              Text(
                                '245',
                                style: TextStyle(
                                    fontSize: getSizeByScreenWidth(context, 6),
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Total Taps',
                                style: TextStyle(
                                    color:
                                        AppColors.lighterDark.withOpacity(0.9),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: getSizeByScreenWidth(context, 3),
                ),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withOpacity(0.05),
                          spreadRadius: 1,
                          blurRadius: 5,
                          blurStyle: BlurStyle.outer,
                        ),
                      ]),
                  child: Card(
                    elevation: getSizeByScreenHeight(context, 0),
                    color: AppColors.background,
                    surfaceTintColor: Colors.transparent,
                    shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(3),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: getSizeByScreenWidth(context, 3),
                        vertical: getSizeByScreenHeight(context, 1.5),
                      ),
                      child: Row(
                        children: [
                          const Image(
                            image: AssetImage(AppConstants.tapping),
                          ),
                          MySizedBox(
                            width: getSizeByScreenWidth(context, 1),
                          ),
                          Column(
                            children: [
                              Text(
                                '+17',
                                style: TextStyle(
                                    fontSize: getSizeByScreenWidth(context, 6),
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Saved Contact',
                                style: TextStyle(
                                  color: AppColors.lighterDark.withOpacity(0.9),
                                  fontWeight: FontWeight.bold,
                                  fontSize: getSizeByScreenWidth(context, 3),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getSizeByScreenWidth(context, 2),
              vertical: getSizeByScreenHeight(context, 2),
            ),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.05),
                      spreadRadius: 1,
                      blurRadius: 5,
                      blurStyle: BlurStyle.outer,
                    ),
                  ]),
              child: Card(
                color: Colors.white,
                surfaceTintColor: Colors.transparent,
                elevation: getSizeByScreenWidth(context, 0),
                shape: const BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(3),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: getSizeByScreenWidth(context, 3),
                    top: getSizeByScreenHeight(context, 1.5),
                    bottom: getSizeByScreenHeight(context, 1.5),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: getSizeByScreenHeight(context, 2)),
                        child: MyText(
                          text: 'Money Saved',
                          fontSize: getSizeByScreenWidth(context, 4.5),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      MySizedBox(
                        width: getSizeByScreenWidth(context, 2),
                      ),
                      const Column(
                        children: [
                          MySizedBox(
                            width: 30,
                            child: Image(
                              image: AssetImage(AppConstants.graph),
                            ),
                          ),
                        ],
                      ),
                      const MySizedBox(
                        width: 9,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: getSizeByScreenHeight(context, 1),
                        ),
                        child: MyText(
                          text: '\$120',
                          fontSize: getSizeByScreenWidth(context, 6),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: getSizeByScreenWidth(context, 7),
            ),
            child: const MyText(
              text: 'Enviroment Impact',
              fontWeight: FontWeight.w600,
            ),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: getSizeByScreenWidth(context, 2),
                  top: getSizeByScreenHeight(context, 2),
                ),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withOpacity(0.05),
                          spreadRadius: 1,
                          blurRadius: 5,
                          blurStyle: BlurStyle.outer,
                        ),
                      ]),
                  child: Card(
                    elevation: getSizeByScreenHeight(context, 0),
                    color: AppColors.background,
                    surfaceTintColor: Colors.transparent,
                    shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(3),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: getSizeByScreenWidth(context, 3),
                        vertical: getSizeByScreenHeight(context, 1.5),
                      ),
                      child: Row(
                        children: [
                          const Image(
                            image: AssetImage(AppConstants.forest),
                          ),
                          MySizedBox(
                            width: getSizeByScreenWidth(context, 2),
                          ),
                          Column(
                            children: [
                              Text(
                                '245',
                                style: TextStyle(
                                    fontSize: getSizeByScreenWidth(context, 6),
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Tree Saved',
                                style: TextStyle(
                                    color:
                                        AppColors.lighterDark.withOpacity(0.9),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: getSizeByScreenWidth(context, 3),
                    top: getSizeByScreenHeight(context, 2)),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withOpacity(0.05),
                          spreadRadius: 1,
                          blurRadius: 5,
                          blurStyle: BlurStyle.outer,
                        ),
                      ]),
                  child: Card(
                    elevation: getSizeByScreenHeight(context, 0),
                    color: AppColors.background,
                    surfaceTintColor: Colors.transparent,
                    shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(3),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: getSizeByScreenWidth(context, 2),
                        vertical: getSizeByScreenHeight(context, 1.5),
                      ),
                      child: Row(
                        children: [
                          const Image(
                            image: AssetImage(AppConstants.statistics),
                          ),
                          MySizedBox(
                            width: getSizeByScreenWidth(context, 1),
                          ),
                          Column(
                            children: [
                              Text(
                                '+17',
                                style: TextStyle(
                                    fontSize: getSizeByScreenWidth(context, 6),
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Saved Contact',
                                style: TextStyle(
                                  color: AppColors.lighterDark.withOpacity(0.9),
                                  fontWeight: FontWeight.bold,
                                  fontSize: getSizeByScreenWidth(context, 3),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getSizeByScreenWidth(context, 2),
            ),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.05),
                      spreadRadius: 1,
                      blurRadius: 5,
                      blurStyle: BlurStyle.outer,
                    ),
                  ]),
              child: Card(
                color: Colors.white,
                surfaceTintColor: Colors.transparent,
                elevation: getSizeByScreenWidth(context, 0),
                shape: const BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(4),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: getSizeByScreenWidth(context, 0),
                    top: getSizeByScreenHeight(context, 1.5),
                    bottom: getSizeByScreenHeight(context, 0),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: getSizeByScreenWidth(context, 5),
                            ),
                            child: const MyText(
                              text: 'Tags Taps ',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const MySizedBox(
                        height: 2,
                      ),
                      const MySizedBox(
                        width: 96,
                        height: 30,
                        child: Graph(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
