// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors, prefer_typing_uninitialized_variables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:telesmile/src/constants/loggers.dart';
import 'package:telesmile/src/models/topic_model.dart';
import 'package:telesmile/src/services/http_services.dart';
import 'package:telesmile/src/view/widgets/widgets.dart';

import 'topics_details.dart';

@immutable
// ignore: must_be_immutable
class Topics extends StatefulWidget {
  final String categoryid;
  String? arabicname;
  Topics({required this.categoryid, this.arabicname});
  // const Topics({Key? key}) : super(key: key);

  @override
  State<Topics> createState() => _TopicsState();
}

class _TopicsState extends State<Topics> {
  var topics;
  bool isLoading = true;
  loadTopics(String id) async {
    var result = await getTopicsModel(id: id);
    setState(() {
      topics = TopicsModel.fromJson(result!);
      isLoading = false;
      logger.d('[Topics] data: ' + topics.resultArray[0].catSubTitle);
    });
  }

  @override
  void initState() {
    loadTopics(widget.categoryid);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //*! Category Title in English
                    AppText(
                      heading: topics.resultArray[0].catTitle +
                          " " +
                          topics.resultArray[0].catSubTitle,
                    ),
                    const SizedBox(height: 5),
                    //*! Category Description in English
                    English(text: topics.resultArray[0].catDesc),
                    const SizedBox(height: 30),
                    //*! Category Title in Arabic
                    AppText(heading: widget.arabicname),
                    const SizedBox(height: 5),
                    //*! Category Description in Arabic
                    Arabic(arabic: topics.resultArray![0].catArabDesc),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemCount: topics.resultArray[0].topic.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => TopicDetails(
                                        topicid: topics.resultArray[0]
                                            .topic[index].topicId)));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 30.0),
                            child: Container(
                                // height: MediaQuery.of(context).size.height*0.1,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    width: 3,
                                    color: const Color(0xFFFCB117),
                                  ),
                                ),
                                child: ListTile(
                                  contentPadding: EdgeInsets.only(right: 4),
                                  leading: Image(image: CachedNetworkImageProvider(topics.resultArray![0].topic[index].titleImage),fit: BoxFit.fill,),
                                  // Image.asset(
                                  //   'assets/blind men.png',
                                  //   fit: BoxFit.fill,
                                  // ),
                                  title: Text(
                                        topics
                                            .resultArray![0].topic![index].title,
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                )
                                ),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 20)
                  ],
                ),
              ),
            ),
    );
  }
}
