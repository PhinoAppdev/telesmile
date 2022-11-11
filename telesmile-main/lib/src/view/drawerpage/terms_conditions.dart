// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';

import '../widgets/header.dart';

class TermsConditions extends StatefulWidget {
  const TermsConditions({Key? key}) : super(key: key);

  @override
  _TermsConditionsState createState() => _TermsConditionsState();
}

class _TermsConditionsState extends State<TermsConditions> {
  int? _value = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header('Terms and Conditions'),
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
          English(
            boldtext: "Disclaimer\n",
            normal:
                "Telesmile mobile application” will provide the oral health awareness information to the disabled community. The information provided here may change from time to time without any prior notice. All the information is provided by “Telesmile application” is for improving the oral health status and oral hygiene practice among the disabled community such as visual impairness, deafness, mental retardation, Autism and Down syndrome in the Kingdom of Saudi Arabia.\nWe give our full efforts to keep the information on the application updated and scientifically designed under the supervision of the experts in their related fields. There is no type of representation made from us nor do we provide any warranties of any kind, whether express or implied, in relation to the accuracy, availability, suitability, reliability with respect of the information, product, services, or related matter contained on the application. Therefore the information used by you is solely at your own risk.\nWe shall not be responsible or liable in any case for any loss or damage including indirect or consequential loss or damage, or any loss or damage whatsoever caused due from loss of data or profits arising out of, or in connection with, the use of this application.We are trying our best to keep the application up and function smoothly. However, “Telesmile application” is not liable or responsible for the application being unavailable for a temporary period due to some technical problems which cannot be controlled by us.",
          ),
        ],
      );
    } else if (_value == 2) {
      return Column(
        children: [
          Arab(
            boldtext: "الشروط والأحكام:\n\nاخلاء المسؤوليه\n",
            normal:
                'وسيوفر "تطبيق الهاتف المحمول عبر الهاتف المحمول" معلومات التوعية بصحة الفم لمجتمع المعاقين. قد تتغير المعلومات المقدمة هنا من وقت لآخر دون أي إشعار مسبق. كل ما يتم توفيره من خلال "Telesmile mobile application" هو تحسين حالة صحة الفم وممارسة نظافة الفم بين مجتمع المعاقين مثل ضعف البصر والصمم والتخلف العقلي والتوحد ومتلازمة داون في المملكة العربية السعودية.\nنحن نبذل جهودنا الكاملة لتكون المعلومات على تطبيق محدثة ومصممة علميا تحت إشراف الخبراء في المجالات ذات الصلة بهم. لا يوجد أي نوع من التمثيل المقدم منا ولا نقدم أي ضمانات من أي نوع، سواء كانت صريحة أو ضمنية، فيما يتعلق بدقة أو توافر أو ملاءمة أو موثوقية فيما يتعلق بالمعلومات أو المنتج أو الخدمات أو المسألة ذات الصلة الواردة في  التطبيق. ولذلك فإن المعلومات التي تستخدمها هي فقط على مسؤوليتك الخاصة.\nلن نكون مسؤولين في أي حال عن أي خسارة أو ضرر بما في ذلك الخسائر أو الضرر غير المباشر أو التبعي، أو أي خسارة أو ضرر من أي نوع ناجم عن فقدان البيانات أو الأرباح الناشئة عن استخدام هذا التطبيق أو في الاتصال به. نحن نحاول قصارى جهدنا للحفاظ على التطبيق حتى يعمل بسلاسة. ومع ذلك ، "Telesmile mobile application  ليس مسؤولاً عن عدم توفر التطبيق لفترة مؤقتة بسبب بعض المشاكل التقنية التي لا يمكن السيطرة عليها من قبلنا.\n',
          )
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
