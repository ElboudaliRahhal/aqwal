import 'package:flutter/material.dart';
import 'tools/Container_for_grid.dart';
import 'NavBar.dart';
import 'tools/Mycontainer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.orange,
    Colors.purple,
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.orange,
    Colors.purple,
  ];
  final List<String> quote = [
    'كل الناس محض ادوات',
    'أنَّى لك المضيُّ قُدمًا وأنتَ تندمُ على الماضي..؟!',
    'في المرة القادمة إستخدم أكاديب تناسب عقلي وليس عقلك',
    '"الرحمة هي علامة على الضعف".',
    '"السعادة هي الهدف النهائي للحياة، وعلينا أن نسعى إليها بكل ما لدينا من قوة".',
    'لا تخلق السماء شخصا فوق او اسفل  شخص ، نحن سواسية عند الولادة لكن بعدها تظهر الفجوة',
    'حتى أخطر أخطائك لا ينبغي أن توقفك عن المضي قدمًا.',
    'أتمنى لك الأفضل لكنني الأفضل',
    '"الرحمة هي علامة على الضعف".',
    '"الحب هو أقوى قوة في الكون، وعلينا أن نعيشه في كل لحظة من حياتنا".'
  ];
  final List<String> name = [
    'Ayanokouji kiyotaka',
    'Edward elric',
    'profesor',
    'نيقولو مكيفلي',
    'المهدي المنجرة',
    'Ayanokouji kiyotaka',
    'Edward elric',
    'profesor',
    'نيقولو مكيفلي',
    'المهدي المنجرة',
  ];
  final List<String> name_show = [
    'Classroom of the elite',
    'Fullmetal Alchemist: Brotherhood',
    'la casa de papel',
    'كتاب',
    'كتاب',
    'Classroom of the elite',
    'Fullmetal Alchemist: Brotherhood',
    'la casa de papel',
    'كتاب',
    'كتاب',
  ];
  final List<String> image_path = [
    'assets/Ayanokouji.jpg',
    'assets/edward.jpg',
    'assets/profesor.jpg',
    'assets/nikolo.jpg',
    'assets/Mahdi.jpg',
    'assets/Ayanokouji.jpg',
    'assets/edward.jpg',
    'assets/profesor.jpg',
    'assets/nikolo.jpg',
    'assets/Mahdi.jpg',
  ];

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            children: [
              Row(
                  children: [
                    Expanded(
                      child: Text(
                          'المميزة',
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),

              Expanded(
                flex: 1,
                child: PageView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Mycontainer(
                        color: colors[index],
                        name: name[index],
                        name_show: name_show[index],
                        quote: quote[index],
                        image_path: image_path[index],
                      );
                    },
                  ),

              ),
              Row(
                  children: [
                    Expanded(
                      child: Text(
                        ' الجديدة',
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),

              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.white,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.5,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container_for_grid(
                          quaot: quote[index],
                          name: name[index],
                          name_show: name_show[index],
                          imagePath: image_path[index],
                          color: colors[index]
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
      ),

    );
  }
}
