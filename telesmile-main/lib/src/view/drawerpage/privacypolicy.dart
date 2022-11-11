// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable

import 'dart:ui';

import 'package:flutter/material.dart';

import '../widgets/header.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  int _value = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header('Privacy Policy'),
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
            boldtext: "Privacy policy\n",
            normal:
                "This Privacy Policy (“Policy”) describes the policies and procedures on the collection, use, disclosure and protection of your information when you use “Telesmile application”, developed by dental interns at College of Dentistry, JazanUnivarsity, Saudi Arabia.Please read this Policy before using the Telesmile Platform or submitting any personal information to Telesmile. This Policy is a part of and incorporated within, and is to be read along with, the Terms of Use.",
          ),
          const SizedBox(height: 25),
          English(
            boldtext: "Your Consent\n",
            normal:
                "By using the Telesmile Platform and the Services, you agree and consent to the collection, transfer, use, storage, disclosure and sharing of your oral health information as described and collected by us in accordance with this Policy. If you do not agree with the Policy, please do not use or access the Telesmile Platform.",
          ),
          const SizedBox(height: 25),
          English(
            boldtext: "Policy Changes\n",
            normal:
                "We may occasionally update this Policy and such changes will be posted on this page. If we make any significant changes to this Policy we will endeavour to provide you with reasonable notice of such changes, such as via prominent notice on the Telesmile Platform or to your email address on record and where required by applicable law, we will obtain your consent. To the extent permitted under the applicable law, your continued use of our Services after we publish or send a notice about our changes to this Policy shall constitute your consent to the updated Policy.",
          ),
          const SizedBox(height: 25),
          English(
            boldtext: "Information We Collect From You\n",
            normal:
                "We will collect and process the following information about you:\nInformation you give us - This includes information submitted when you: Create or update your Telesmile account, which may include your name, email, phone number, login name and password, address.\nCorrespond with “Telesmile” for online support;Participate in the interactive services offered by the telesmile Platform such as discussion boards. When you communicate with us through the telesmile Platform, we may maintain a record of your communication.",
          ),
          const SizedBox(height: 25),
          English(
            boldtext: "Disclosure and Distribution of Your Information\n",
            normal:
                "We may share your information that we collect for following purposes:\nWith Service Providers: We may share your information with our general dentists, specialists and consultants.",
          ),
          const SizedBox(height: 25),
          English(
            boldtext: "Data Security Precautions\n",
            normal:
                "Please be aware that the transmission of information via the internet is not completely secure. Although we will do our best to protect your personal data, we cannot guarantee the security of your data transmitted through the Telesmile Platform. Once we have received your information, we will use strict physical, electronic, and procedural safeguards to try to prevent unauthorised access.",
          ),
          const SizedBox(height: 25),
          English(
            boldtext: "Telesmile Platform Security\n",
            normal:
                "If you have any queries relating to the processing or usage of information provided by you in connection with this Policy, please email us at ahmad955mls@gmail.com or at the following address: College of Dentistry, Jazan University, Saudi Arabia.",
          )
        ],
      );
    } else if (_value == 2) {
      return Column(
        children: [
          //*!-------------------------------Privacy policy-------------------------------
          Arab(
            boldtext: "سياسة الخصوصية\n",
            normal:
                'سياسة الخصوصية هذه ("السياسة") تصف السياسات والإجراءات المتعلقة بجمع واستخدام والكشف وحماية معلوماتك عند استخدام "تطبيق "Telesmile mobile application "، الذي وضعه متدربوا طب الأسنان في كلية طب الأسنان، Jazan University، المملكة العربية السعودية.يرجى قراءة هذه السياسة قبل استخدام منصة تيليسميل أو تقديم أي معلومات شخصية إلى "Telesmile mobile application. هذه السياسة هي جزء من بنود الاستخدام، ويجب أن تقرأ معها.\n',
          ),
          const SizedBox(height: 25),

          //*!-------------------------------Your Consent-------------------------------

          Arab(
            boldtext: 'موافقتك\n',
            normal:
                'باستخدام منصة تيلي سمايل والخدمات، فإنك توافق وتوافق على جمع ونقل واستخدام وتخزين والكشف ومشاركة المعلومات الخاصة بصحة الفم  كما وصفها وجمعها من قبلنا وفقا لهذه السياسة. إذا كنت لا توافق على السياسة، يرجى عدم استخدام أو الوصول إلى منصة تيلي سمايل.',
          ),
          const SizedBox(height: 25),

          //*!-------------------------------Policy Changes-------------------------------

          Arab(
            boldtext: 'تغييرات السياسة\n',
            normal:
                'قد نقوم بتحديث هذه السياسة من حين لآخر وسيتم نشر هذه التغييرات على هذه الصفحة. إذا قمنا بإجراء أي تغييرات هامة على هذه السياسة، فإننا سنسعى لتزويدك بإشعار معقول بهذه التغييرات، مثل إشعار بارز على منصة "Telesmile mobile application أو إلى عنوان بريدك الإلكتروني المسجل، وعند الاقتضاء بموجب القانون المعمول به، سنحصل على موافقتك. إلى الحد المسموح به بموجب القانون المعمول به، فإن استمرار استخدامك لخدماتنا بعد نشر أو إرسال إشعار حول تغييراتنا على هذه السياسة سيشكل موافقتك على السياسة المحدثة.',
          ),
          const SizedBox(height: 25),

          //*!-------------------------------Information We Collect From You-------------------------------

          Arab(
            boldtext: "المعلومات التي نجمعها منك\n",
            normal:
                'سنقوم بجمع ومعالجة المعلومات التالية عنك:\nالمعلومات التي تقدمها لنا - تتضمن هذه المعلومات المعلومات المقدمة عند إنشاء أو تحديث حساب "Telesmile mobile application الخاص بك، والذي قد يتضمن اسمك، بريدك الإلكتروني، رقم هاتفك، اسم تسجيل الدخول وكلمة المرور، العنوان. تتوافق مع " تيلي سمايل " للحصول على الدعم عبر الإنترنت؛ المشاركة في الخدمات التفاعلية التي يقدمها منصة إعادة الرسائل الهاتفية مثل لوحات المناقشة. عند التواصل معنا من خلال منصة تيلي سمايل ، قد نحتفظ بسجل الاتصالات الخاصة بك.',
          ),
          const SizedBox(height: 25),

          //*!-------------------------------Disclosure and Distribution of Your Information-------------------------------

          Arab(
            boldtext: "إفشاء وتوزيع المعلومات الخاصة بك\n",
            normal:
                "قد نشارك معلوماتك التي نجمعها للأغراض التالية:\nمع مقدمي الخدمات: قد نشارك معلوماتك مع أطباء الأسنان العامين والمتخصصين والاستشاريين. ",
          ),
          const SizedBox(height: 25),
          
          //*!-------------------------------Data Security Precautions-------------------------------

          Arab(
            boldtext: "احتياطات أمن البيانات\n",
            normal:
                "يرجى العلم أن نقل المعلومات عبر الإنترنت ليس آمنا تماما. على الرغم من أننا سنبذل قصارى جهدنا لحماية بياناتك الشخصية، إلا أننا لا نضمن أمن بياناتك المرسلة من خلال منصة تيلي سمايل. بمجرد استلامنا لمعلوماتك، سنستخدم ضمانات مادية وإليكترونية وإجرائية صارمة لمحاولة منع الوصول غير المصرح به.",
          ),
          const SizedBox(height: 25),

          //*!-------------------------------Data Security Precautions-------------------------------

          Arab(
            boldtext: "تيلي سمايل منصة الأمن\n",
            normal:
                "إذا كان لديك أي استفسارات تتعلق بمعالجة أو استخدام المعلومات المقدمة من قبلك فيما يتعلق بهذه السياسة، يرجى مراسلتنا عبر البريد الإلكتروني على ahmad955mls@gmail.com أو العنوان التالي: كلية طب الأسنان، جامعة جازان، المملكة العربية السعودية.",
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
