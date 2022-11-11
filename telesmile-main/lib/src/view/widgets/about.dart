// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telesmile/src/controller/blindmode_controller.dart';
import 'package:telesmile/src/view/widgets/texts.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final blindcontroller = Get.put(Blindmode());
  @override
  void initState() {
    blindcontroller.blind(false);
    super.initState();
  }

  int? _value = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(
          heading: 'About Us',
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        // leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {},),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              DropdownButton(
                isExpanded: false,
                value: _value,
                items: const [
                  DropdownMenuItem(
                    child: Center(
                      child: Text(
                        'English',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                    value: 1,
                  ),
                  DropdownMenuItem(
                    child: Center(
                      child: Text(
                        'Arabic',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                    value: 2,
                  ),
                ],
                onChanged: (int? value) {
                  if (value == 1) {
                    setState(() {
                      _value = 1;
                    });
                  } else if (value == 2) {
                    setState(() {
                      _value = 2;
                    });
                  }
                },
              ),
              const SizedBox(height: 10),
              _renderWidget(),
            ],
          ),
        ),
      ),
    );
  }

  _renderWidget() {
    if (_value == 1) {
      return Column(
        children: [
          //*!----------------------About Us----------------------

          English(
            boldtext: "ABOUT US:\n",
            normal:
                "WHO WE ARE\nWe are a group of Dental intern researchers, Dr. Hamza Khan, Dr. Abdulrahman Akkam, Dr. Edrees & Dr. Sultan Korairi, along with our two supervisors, Dr. Manawar Ahmad Mansoor & Dr. Hytham Fageeh, from College of Dentistry, Jazan University, Saudi Arabia. We are dedicated to provide an efficient solution by creating the “mobile application - Telesmile” to improve the knowledge regarding the oral health care and oral hygiene practice for the individuals with disability such as Visual impairment (blindness), Deaf, Mental retardation, Autism and Down syndrome in the Kingdom of Saudi Arabia.",
          ),
          const SizedBox(height: 20),

          //*!----------------------Missions----------------------

          English(
            boldtext: "Our Mission\n",
            normal:
                "Our Mission is to improve the oral health status and oral hygiene practice of disabled people.",
          ),
          const SizedBox(height: 20),

          //*!----------------------Vissins----------------------

          English(
            boldtext: "Our Vision\n",
            normal:
                "Our Vision is to provide the scientifically approved best oral health care to the individuals with disability.",
          ),
          const SizedBox(height: 20),

          //*!----------------------Goals----------------------

          English(
            boldtext: "Our Goals\n",
            normal:
                "To train more dental professional who can communicate with the disabled patients.To create more scientific methods to improve the oral health status of the disabled community in Saudi Arabia.",
          ),
          const SizedBox(height: 40),

          //*!----------------------Acknowlwdgements----------------------

          EnglishAck(
            boldtext:
                "ACKNOWLEDGEMENTS:                                        ",
          ),

          const SizedBox(height: 10),
          //*!----------------Oral Health for Blind----------------------

          EnglishAck(
            boldtext: '"Oral Health for Blind" Project:\n',
            normal: "1. ",
            underline:
                "Dr Hussam Mousa Zayid Muyidi, College of Dentistry, Jazan",
          ),
          const SizedBox(height: 10),
          EnglishAck(
            normal: "2. ",
            underline: "Dr Abu Bakr Ahmed, College of Dentistry, Jazan",
            spacing: 1.5,
          ),
          const SizedBox(height: 10),
          EnglishAck(
            normal: "3. ",
            underline: "Dr Sameer Jubran Ogayshi, College of Dentistry, Jazan",
          ),
          const SizedBox(height: 10),
          EnglishAck(
            normal: "4. ",
            underline:
                "Dr Ahlam Khalid Mohamed Jarebi,, College of Dentistry, Jazan (Voice recording)",
            spacing: 0.8,
          ),

          //*!----------------------Oral Health for Deaf----------------------

          const SizedBox(height: 25),
          EnglishAck(
            boldtext: '"Oral Health for Deaf" Project:\n',
            normal: "1. ",
            underline: "Dr Tariq Mohammed Qassadi, College of Dentistry, Jazan",
          ),
          const SizedBox(height: 10),
          EnglishAck(
            normal: "2. ",
            underline: "Dr Alhassan Ali Owis, College of Dentistry, Jazan",
            spacing: 1.5,
          ),
          const SizedBox(height: 10),
          EnglishAck(
            normal: "3. ",
            underline: "Dr Ismail Qasim Aalhadidi, College of Dentistry, Jazan",
            spacing: 0,
          ),
          const SizedBox(height: 10),
          EnglishAck(
            normal: "4. ",
            underline: "Dr Abdullah Ahmed Sahli, College of Dentistry, Jazan",
            spacing: 1,
          ),

          //*!----------------------Oral Health for Autistic children----------------------

          const SizedBox(height: 25),
          EnglishAck(
            boldtext: '"Oral Health for Autistic children" Project: \n',
            wrdspacing: -1.7,
            normal: "1. ",
            underline: "Dr Hatim Yahya Thubab, College of Dentistry, Jazan",
            spacing: 0,
          ),
          const SizedBox(height: 10),
          EnglishAck(
            normal: "2. ",
            underline: "Dr Hassan Hadi Zakri, College of Dentistry, Jazan",
            spacing: 1,
          ),
          const SizedBox(height: 10),
          EnglishAck(
            normal: "3. ",
            underline: "Dr Mohammed Buhays Jarab, College of Dentistry, Jazan",
            spacing: 0,
          ),
          const SizedBox(height: 10),
          EnglishAck(
            normal: "4. ",
            underline: "Dr Ahmed Yahya Juraybi, College of Dentistry, Jazan",
            spacing: 1,
          ),
          const SizedBox(height: 10),
          EnglishAck(
            normal: "5. ",
            underline:
                "Dr Abdallah Bahri, College of Dentistry, multimedia file developer, Baish",
            spacing: 0,
          ),
          const SizedBox(height: 10),
          EnglishAck(
            normal: "6. ",
            underline:
                "Dr Ahlam Khalid Mohamed Jarebi, College of Dentistry, Jazan (Voice recording)",
            spacing: 1,
          ),

          //*!----------------------Oral Health for Autistic children----------------------

          const SizedBox(height: 25),
          EnglishAck(
            boldtext: '"Oral Health for childern with Down syndrome" Project: \n',
            wrdspacing: -1.7,
            normal: "1. ",
            underline: "Dr Abdul Kareem College of Dentistry, Jazan",
            spacing: 0,
          ),
          const SizedBox(height: 10),
          EnglishAck(
            normal: "2. ",
            underline: "Dr Turki Khuraizi College of Dentistry, Jazan",
            spacing: 0,
          ),
          const SizedBox(height: 10),
          EnglishAck(
            normal: "3. ",
            underline: "Dr Khalil Marran College of Dentistry, Jazan",
            spacing: 0,
          ),
          const SizedBox(height: 10),
          EnglishAck(
            normal: "4. ",
            underline: "Dr Naif Darwesh College of Dentistry, Jazan",
            spacing: 0,
          ),
          const SizedBox(height: 10),
        ],
      );
    } else if (_value == 2) {
      return Column(
        children: [
          //*!--------------------------Arab--------------------------
          Arab(
            boldtext: "من نحن:\n",
            normal:
                "من نحن\nنحن مجموعة من الباحثين المتدربين في الأسنان،  د.حمزة  خان, د.عبدالرحمن عكام، د. إدريس مهدلي, د. سلطان كريري، جنبا إلى جنب مع اثنين من المشرفين لدينا، الدكتورمنور أحمد منصور والدكتور هيثم فقيه، من كلية طب الأسنان، جامعة جازان، المملكة العربية السعودية. نحن ملتزمون بتوفير حل فعال من خلال إنشاء تطبيق الهاتف المحمول - 'Telesmile' لتحسين المعرفة فيما يتعلق بالرعاية الصحية للفم وممارسة نظافة الفم للأفراد ذوي الإعاقة مثل ضعف البصر (العمى) والصم  والتخلف العقلي والتوحد ومتلازمة داون في المملكة العربية السعودية",
          ),
          const SizedBox(height: 20),
          Arab(
            boldtext: "مهمتنا\n",
            normal:
                "مهمتنا هي تحسين الحالة الصحية للفم وممارسة نظافة الفم  للأشخاص ذوي الإعاقة",
          ),
          const SizedBox(height: 20),
          Arab(
            boldtext: "رؤيتنا\n",
            normal:
                "الرؤية الخاصة بنا هي توفير أفضل رعاية صحية للفم المعتمدة علميا  للأفراد ذوي الإعاقة",
          ),
          const SizedBox(height: 20),
          Arab(
            boldtext: "أهدافنا\n",
            normal:
                "تدريب المزيد من أطباء الأسنان الذين يمكنهم التواصل مع المرضى المعاقين\nخلق المزيد من الأساليب العلمية لتحسين الحالة الصحية للفم في مجتمع المعاقين في المملكة العربية السعودية.",
          ),
        ],
      );
    }
  }
}

class Arab extends StatelessWidget {
  String? boldtext;
  String? normal;
  Arab({
    Key? key,
    this.boldtext,
    this.normal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: boldtext,
        style: const TextStyle(
          fontFamily: 'Almarai',
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        children: [
          TextSpan(
            text: normal,
            style: const TextStyle(
                fontFamily: 'Almarai',
                fontSize: 18,
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
      textAlign: TextAlign.justify,
      textDirection: TextDirection.rtl,
      softWrap: true,
    );
  }
}

class English extends StatelessWidget {
  String? boldtext;
  String? normal;
  English({Key? key, this.boldtext, this.normal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: boldtext,
        style: const TextStyle(
            fontFamily: 'Poppins', fontSize: 17, fontWeight: FontWeight.bold),
        children: [
          TextSpan(
            text: normal,
            style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 17,
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
      textAlign: TextAlign.justify,
      softWrap: true,
      textDirection: TextDirection.ltr,
    );
  }
}

class EnglishAck extends StatelessWidget {
  String? underline;
  String? boldtext;
  String? normal;
  double? spacing;
  double? wrdspacing;
  EnglishAck(
      {Key? key,
      this.boldtext,
      this.normal,
      this.underline,
      this.spacing,
      this.wrdspacing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: boldtext,
        style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 17,
            fontWeight: FontWeight.bold,
            wordSpacing: wrdspacing),
        children: [
          TextSpan(
            text: normal,
            style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 17,
                fontWeight: FontWeight.w400),
          ),
          TextSpan(
            text: underline,
            style: TextStyle(
                decoration: TextDecoration.underline,
                fontFamily: 'Poppins',
                fontSize: 17,
                fontWeight: FontWeight.w400,
                letterSpacing: spacing),
          ),
        ],
      ),
      textAlign: TextAlign.justify,
      maxLines: 10,
      textDirection: TextDirection.ltr,
    );
  }
}
