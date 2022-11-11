// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import '../widgets/header.dart';

class TermsUse extends StatefulWidget {
  const TermsUse({Key? key}) : super(key: key);

  @override
  _TermsUseState createState() => _TermsUseState();
}

class _TermsUseState extends State<TermsUse> {
  int? _value = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        'Terms of Use',
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
          English(
            boldtext: "1. ",
            normal:
                "These terms and conditions of use (“Terms of Use”) describe the terms applicable to your use of this digital application for the purposes of use and promotion of oral health status and oral hygiene practice among disabled community.",
          ),
          English(
              boldtext:
                  "2. Intellectual Property Rights                       \nYou shall not:",
              align: TextAlign.left),
          English(
            boldtext: "•\t",
            normal:
                "(a) License, sell, rent, lease, transfer, assign, distribute, host, or otherwise commercially exploit the Covered Sites, without express written consent of telesmile;",
          ),
          English(
            boldtext: "•\t",
            normal:
                "(b) You shall not modify, make derivative works of, disassemble, reverse compile or reverse engineer any part of the Covered Sites;",
          ),
          English(
            boldtext: "•\t",
            normal:
                "(c) You shall not access the Covered Sites in order to build a similar or competitive service;",
          ),
          English(
            boldtext: "•\t",
            normal:
                "(d) Copy, reproduce, distribute, republish, download, displayed, poste or transmit in any form or by any means, any part of the Covered Sites, for any commercial purpose, without express written consent of telesmile;",
          ),
          English(
            boldtext: "•\t",
            normal:
                "(e) Use the Covered Sites in any way that causes, or may cause, damage to the Covered Sites or impair the availability or accessibility of the Covered Sites or in any way which is unlawful, illegal, fraudulent or harmful, or in connection with any unlawful, illegal, fraudulent or harmful purpose or activity",
          ),
          English(
            boldtext: "•\t",
            normal:
                "(f) Conduct any systematic or automated data collection activities on or in relation to the Covered Sites without express written consent of telesmile.",
          ),
        ],
      );
    } else if (_value == 2) {
      return Column(
        children: [
          Arab(
            boldtext:
                "شروط الاستخدام                                                                  \n",
          ),
          Arab(
            boldtext: "1. ",
            normal:
                "هذه الشروط والأحكام الاستخدام ('شروط الاستخدام') وصف المصطلحات المطبقة على استخدامك لهذا التطبيق الرقمي لأغراض استخدام وتعزيز حالة صحة الفم وممارسة نظافة الفم بين المجتمع المعوقين.",
            // align: TextAlign.justify,
          ),
          Arab(
            boldtext:
                "2. حقوق الملكية الفكرية                                                           \n",
            normal: "لا يجوز لك:",
          ),
          Arab(
            boldtext: "• ",
            normal:
                "(أ) الترخيص أو البيع أو الإيجار أو الإيجار أو النقل أو التعيين أو التوزيع أو المضيف أو استغلال المواقع المشمولة تجاريا، دون موافقة كتابية صريحة من telesmile؛",
          ),
          Arab(
            boldtext: "• ",
            normal:
                "(ب) لا يجوز لك تعديل أو عمل أعمال مشتقة أو تفكيك أو ترجمة عكسية أو عكس مهندس أي جزء من المواقع المشمولة؛",
          ),
          Arab(
            boldtext: "• ",
            normal:
                "(ج) لا يجوز لك الوصول إلى المواقع المشمولة من أجل بناء خدمة مماثلة أو تنافسية؛",
          ),
          Arab(
            boldtext: "• ",
            normal:
                "(د) نسخ أو استنساخ أو توزيع أو إعادة نشر أو تنزيل أو عرض أو نشر أو إرسال بأي شكل أو بأي وسيلة من المواقع المشمولة، لأي غرض تجاري، دون موافقة خطية صريحة من البريد الإلكتروني؛",
          ),
          Arab(
            boldtext: "• ",
            normal:
                "(ه) استخدام المواقع المشمولة بأي طريقة تسبب أو قد تسبب ضررا للمواقع المغطاة أو تعوق توافر أو إمكانية الوصول إلى المواقع المشمولة أو بأي شكل من الأشكال غير قانوني أو غير قانوني أو احتيالي أو ضار، أو فيما يتعلق بأي غرض أو نشاط غير قانوني أو غير قانوني أو احتيالي أو ضار",
          ),
          Arab(
            boldtext: "• ",
            normal:
                "(و) القيام بأي أنشطة منهجية أو مؤتمتة لجمع البيانات على المواقع المشمولة أو فيما يتعلق بها دون موافقة خطية صريحة من  البريد الإلكتروني.",
          ),
        ],
      );
    }
  }
}

class Arab extends StatelessWidget {
  String? boldtext;
  String? normal;
  TextAlign? align;
  Arab({Key? key, this.boldtext, this.normal, this.align}) : super(key: key);

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
  TextAlign? align;
  English({Key? key, this.boldtext, this.normal, this.align}) : super(key: key);

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
