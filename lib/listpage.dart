import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerexample/model/spacemodel.dart';
import 'package:providerexample/providers/spaceprovider.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<SpaceProvider>(context, listen: false).getSpaceData;
  }

  @override
  Widget build(BuildContext context) {
    final postMdl = Provider.of<SpaceProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
            child: ListView.builder(
                itemCount: postMdl.finalData.length,
                itemBuilder: (BuildContext ctxt, int index) {
                  return postMdl.finalData.length != null
                      ? Column(
                        children: [
                          Text("Copy Right:  "+postMdl.finalData[index].copyright.toString()),
                          Text("Explanation:  "+postMdl.finalData[index].explanation.toString()),
                          Text("Title:  "+postMdl.finalData[index].title.toString()),
                        ],
                      )
                      : Center(
                          child: CircularProgressIndicator(),
                        );
                })),
      ),
    );
  }
}
