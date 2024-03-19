import 'package:bizcotap/utils/app_exports.dart';

class TagsLayout extends StatefulWidget {
  const TagsLayout({super.key});

  @override
  State<TagsLayout> createState() => _TagsLayoutState();
}

class _TagsLayoutState extends State<TagsLayout> {
  int selectedDotIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: Column(
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Stack(
                    children: [
                      Swiper(
                        itemCount: tags.length,
                        itemWidth: double.infinity,
                        itemHeight: 250,
                        loop: true,
                        duration: 1000,
                        scrollDirection: Axis.vertical,
                        onIndexChanged: (index) {
                          setState(() {
                            selectedDotIndex = index;
                          });
                        },
                        itemBuilder: (context, index) => SingleTag(
                          tags[index],
                        ),
                        layout: SwiperLayout.STACK,
                      ),
                      Positioned(
                        bottom: 10,
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            tags.length,
                            (index) => Container(
                              width: 8,
                              height: 8,
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: selectedDotIndex == index
                                    ? AppColors.primary
                                    : Colors.grey,
                              ),
                            ),
                          ),
                        ),
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
