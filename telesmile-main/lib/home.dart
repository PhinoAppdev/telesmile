// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable, avoid_unnecessary_containers, non_constant_identifier_names, prefer_typing_uninitialized_variables

// import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:telesmile/src/constants/loggers.dart';
import 'package:telesmile/src/controller/blindmode_controller.dart';
import 'package:telesmile/src/models/get_category_model.dart';
import 'package:telesmile/src/services/http_services.dart';

import 'package:telesmile/src/view/drawerpage/drawer.dart';
import 'package:telesmile/src/view/widgets/topics.dart';
import 'package:telesmile/src/view/widgets/appbar.dart';
import 'package:telesmile/src/view/widgets/texts.dart';

import 'src/view/widgets/consultation_form.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final blindcontroller = Get.put(Blindmode());
  var getCategory;
  bool isLoading = true;
  loadCategories() async {
    var result = await HttpService.getCategoryModel();
    setState(() {
      getCategory = GetCategoryModel.fromJson(result);
      isLoading = false;
      logger.d("[HomePage Category] data: " + getCategory.category[1].catTitle);
      logger.d(
          "[HomePage Category] data: " + getCategory.category[1].catSubTitle);
    });
  }

  @override
  void initState() {
    loadCategories();
    blindcontroller.blind(true);
    blindcontroller.duration(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      drawer: MyDrawer(),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 30),
                  LocalText(topic: 'Commited to excel in Oral health care for'),
                  PrimaryText(topic: '"Everyone in the society"'),
                  SizedBox(
                    height: 20,
                  ),
                  GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: MediaQuery.of(context).size.width /
                            (MediaQuery.of(context).size.height / 1.6)),
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: getCategory.category.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          blindcontroller.blind(false);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => Topics(
                                  categoryid: getCategory.category[index].catId,
                                  arabicname: getCategory
                                      .category[index].catArabicTitle),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.2,
                              width: MediaQuery.of(context).size.width * 0.35,
                              child: Image(
                                image: CachedNetworkImageProvider(
                                    getCategory.category[index].catImg),
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              '(${getCategory.category[index].catArabicTitle})',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              getCategory.category[index].catTitle,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              getCategory.category[index].catSubTitle,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFFCB117),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      blindcontroller.blind(false);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Consultation_form()));
                    },
                    icon: Icon(
                      Icons.call,
                      color: Colors.black,
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xFFFCB117),
                        minimumSize: Size(250, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    label: Text(
                      'Telesmile Consultation',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
    );
  }
}
