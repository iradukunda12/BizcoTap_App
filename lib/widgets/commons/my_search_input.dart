import 'package:bizcotap/utils/app_exports.dart';

class MySearchInput extends StatelessWidget {
  final TextEditingController searchController;
  final Function(String) onSearch;

  const MySearchInput({
    required this.searchController,
    required this.onSearch,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: getSizeByScreenWidth(context, 90),
          child: SizedBox(
            height: 50,
            child: TextField(
              onTapOutside: (event) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              controller: searchController,
              cursorColor: AppColors.lightDark,
              onChanged: onSearch,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromARGB(45, 120, 120, 120),
                prefixIcon: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: AppIcons.search,
                ),
                prefixIconColor: AppColors.lighterDark,
                hintText: "Search contacts",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
