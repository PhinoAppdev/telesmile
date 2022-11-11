// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telesmile/src/controller/blindmode_controller.dart';
import 'package:telesmile/src/view/widgets/texts.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
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
          heading: 'Contact Us',
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
          //*!-----------------1. Dr Hytham Fageeh------------------------------
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: const Image(
              image: AssetImage('assets/Dr Hytham Fageeh.jpeg'),
              fit: BoxFit.fill,
            ),
          ),
          English(
            boldtext: "Dr Hytham Fageeh\n",
            normal:
                "Assistant Professor\nDepartment of Preventive Dental Sciences,\nCollege of Dentistry, Jazan University, Saudi Arabia\nEmail: hfageeh@jazanu.edu.sa\n",
            align: TextAlign.left,
          ),

          //*!------------------------------2. Dr Manawar Ahmad------------------------------

          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: const Image(
              image: AssetImage('assets/Dr Manawar Ahmad.jpg'),
              fit: BoxFit.fill,
            ),
          ),
          English(
            boldtext: "Dr Manawar Ahmad Mansoor\n",
            normal:
                "Assistant Professor\nDepartment of Prosthetic Dental Sciences,\nCollege of Dentistry, Jazan University, Saudi Arabia\t\nPhone number: +966-553662853,\nEmail: ahmad955mls@gmail.com\n",
            align: TextAlign.left,
          ),

          //*!------------------------------3. Dr Hamza Khan------------------------------

          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: const Image(
              image: AssetImage('assets/Dr Hamza Khan.jpg'),
              fit: BoxFit.fill,
            ),
          ),
          English(
            boldtext:
                "Dr Hamza Khan\n",
            normal: "Dental Intern, College of Dentistry, Jazan University, Saudi Arabia\nPhone number:  +966-596009005\nEmail: hmz-sama@live.com\n",
            align: TextAlign.left,
          ),

          //*!------------------------------4. Dr Abdulrahman Akkam------------------------------

          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: const Image(
              image: AssetImage('assets/Dr Abdulrahman Akkam.jpeg'),
              fit: BoxFit.fill,
            ),
          ),
          English(
            boldtext:
                "Dr Abdulrahman Akkam\n",
            normal: "Dental Intern, College of Dentistry, Jazan University, Saudi Arabia\nPhone number:  +966-553361546\nEmail: akkamx4@gmail.com\n",
            align: TextAlign.left,
          ),

          //*!------------------------------5.	Dr Idris Muhaddili------------------------------

          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: const Image(
              image: AssetImage('assets/Dr Idris Muhaddili.jpeg'),
              fit: BoxFit.fill,
            ),
          ),
          English(
            boldtext:
                "Dr Idris Muhaddili\n",
                normal: "Dental Intern, College of Dentistry, Jazan University, Saudi Arabia\nPhone number:  +966-504303688\n",
            align: TextAlign.left,
          ),

          //*!------------------------------6.	Dr Sultan Korairi------------------------------
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: const Image(
              image: AssetImage('assets/Dr Sultan Korairi.PNG'),
              fit: BoxFit.fill,
            ),
          ),
          English(
            boldtext:
                "Dr Sultan Korairi\n",
                normal: "Dental Intern, College of Dentistry, Jazan University, Saudi Arabia\nPhone number:  +61423697442\nEmail: SultanAli@Dr.com",
            align: TextAlign.left,
          ),
        ],
      );
    } else if (_value == 2) {
      return Column(
        children: [
          //*!-----------------1. Dr Hytham Fageeh------------------------------
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: const Image(
              image: AssetImage('assets/Dr Hytham Fageeh.jpeg'),
              fit: BoxFit.fill,
            ),
          ),
           Arab(
             boldtext:"الدكتور هيثم  فقيه\n",
            normal:
                "أستاذ مساعد\nقسم علوم الأسنان الوقائية،\nكلية طب الأسنان، جامعة جازان، المملكة العربية السعودية\nبريد إلكتروني: hfageeh@jazanu.edu.sa\n",
          ),

          //*!------------------------------2. Dr Manawar Ahmad------------------------------

          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: const Image(
              image: AssetImage('assets/Dr Manawar Ahmad.jpg'),
              fit: BoxFit.fill,
            ),
          ),
         Arab(
            boldtext: "الدكتور منور أحمد منصور\n",
            normal:
                "أستاذ مساعد\nقسم علوم الأسنان الاصطناعية،\nكلية طب الأسنان، جامعة جازان، المملكة العربية السعوديةرقم\nالهاتف:- 553662853 966+\nبريد إلكتروني: ahmad955mls@gmail.com\n",
          ),

          //*!------------------------------3. Dr Hamza Khan------------------------------

          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: const Image(
              image: AssetImage('assets/Dr Hamza Khan.jpg'),
              fit: BoxFit.fill,
            ),
          ),
          Arab(
            boldtext:
                "الدكتور حمزة خان\n",
                normal: "متدربة في طب الأسنان ، كلية طب الأسنان ، جامعة جازان ، المملكة العربية السعودية\nرقم الهاتف: + 966-596009005\nالبريد الإلكتروني: hmz-sama@live.com\n",
          ),

          //*!------------------------------4. Dr Abdulrahman Akkam------------------------------

          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: const Image(
              image: AssetImage('assets/Dr Abdulrahman Akkam.jpeg'),
              fit: BoxFit.fill,
            ),
          ),
          Arab(
            boldtext:
                "عبد الرحمن عكام\n",
                normal: "متدربة في طب الأسنان ، كلية طب الأسنان ، جامعة جازان ، المملكة العربية السعودية\nرقم الهاتف: + 966-553361546\nالإلكتروني: akkamx4@gmail.com\n",
          ),

          //*!------------------------------5.	Dr Idris Muhaddili------------------------------

          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: const Image(
              image: AssetImage('assets/Dr Idris Muhaddili.jpeg'),
              fit: BoxFit.fill,
            ),
          ),
          Arab(
            boldtext:
                "الدكتور ادريس مهديلي\n",
                normal: "متدربة في طب الأسنان ، كلية طب الأسنان ، جامعة جازان ، المملكة العربية السعودية\nرقم الهاتف: + 966-504303688\n",
          ),

          //*!------------------------------6.	Dr Sultan Korairi------------------------------
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: const Image(
              image: AssetImage('assets/Dr Sultan Korairi.PNG'),
              fit: BoxFit.fill,
            ),
          ),
          Arab(
            boldtext:
                "الدكتور سلطان قريري\n",
                normal: "متدربة في طب الأسنان ، كلية طب الأسنان ، جامعة جازان ، المملكة العربية السعودية\nرقم الهاتف: +61423697442\n، البريد الإلكتروني: SultanAli@Dr.com\n",
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
      textAlign: align,
      softWrap: true,
      textDirection: TextDirection.ltr,
    );
  }
}
