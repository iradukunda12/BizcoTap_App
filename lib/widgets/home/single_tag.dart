import 'package:bizcotap/utils/app_exports.dart';

class SingleTag extends StatefulWidget {
  const SingleTag(this.tag, {super.key});

  final Tag tag;

  @override
  State<SingleTag> createState() => _SingleTagState();
}

class _SingleTagState extends State<SingleTag> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 350.0,
        height: 225.0,
        decoration: BoxDecoration(
            color: Color(int.parse(
                '0xFF${widget.tag.company.bgColor.replaceAll('#', '')}')),
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(149, 149, 149, 94)
                    .withOpacity(0.2), // Use the same color for the shadow
                spreadRadius: 5,
                blurRadius: 15.365497589111328,
                offset: const Offset(0, 3), // Adjust the offset as needed
              ),
            ]),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 60.0,
              left: 0,
              right: 0,
              child: SizedBox(
                height: 80,
                child: Image.asset(
                  widget.tag.logo,
                ),
              ),
            ),
            Positioned(
              bottom: 20.0,
              left: 20.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    text: widget.tag.name,
                    fontSize: getSizeByScreenWidth(context, 5),
                    color: Color(int.parse(
                        '0xFF${widget.tag.company.fontColor.replaceAll('#', '')}')),
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(
                    height: getSizeByScreenHeight(context, 0.5),
                  ),
                  MyText(
                    text: widget.tag.position,
                    fontSize: getSizeByScreenWidth(context, 3.6),
                    color: Color(int.parse(
                        '0xFF${widget.tag.company.fontColor.replaceAll('#', '')}')),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 20.0,
              right: 20.0,
              height: 30,
              child: calculateBrightness(
                Color(int.parse(
                    '0xFF${widget.tag.company.fontColor.replaceAll('#', '')}')),
              )
                  ? Image.asset('assets/commons/logo.png')
                  : Image.asset('assets/commons/whiteLogo.png'),
            ),
          ],
        ),
      ),
    );
  }
}
