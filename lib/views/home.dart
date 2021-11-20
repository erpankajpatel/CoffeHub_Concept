import 'dart:ui';

import 'package:appconcept/constants/colors.dart';
import 'package:appconcept/constants/const.dart';
import 'package:appconcept/models/item_model.dart';
import 'package:appconcept/routes/routes.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Item> items = [];

  @override
  void initState() {
    super.initState();
    items = Item.items();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          iconSize: 28,
          color: AppColors.primaryColor,
          onPressed: () {},
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            iconSize: 28,
            color: AppColors.primaryColor,
            onPressed: () {},
          ),
          SizedBox(height: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [_headerText(), _listView()],
        ),
      ),
    );
  }

  Widget _headerText() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: RichText(
        text: TextSpan(
          text: 'It\'s Great',
          style: TextStyle(
            fontSize: 35,
            color: Colors.black,
            letterSpacing: letterSpacing,
            fontFamily: fontFamily,
          ),
          children: [
            WidgetSpan(child: SizedBox(width: 10)),
            TextSpan(
              text: 'Day for Coffee.',
              style: TextStyle(
                fontSize: 35,
                color: AppColors.primaryColor,
                letterSpacing: letterSpacing,
                fontWeight: FontWeight.bold,
                fontFamily: fontFamily,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _listView() {
    return ListView.builder(
      itemCount: items.length,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: ClampingScrollPhysics(),
      itemBuilder: (context, index) {
        return ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          leading: Image.asset(
            items[index].image,
            height: items[index].size,
            width: items[index].size,
            filterQuality: FilterQuality.high,
          ),
          title: Text(
            items[index].name,
            style: TextStyle(fontSize: 15, letterSpacing: letterSpacing),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios_rounded,
            size: 15,
            color: AppColors.primaryColor,
          ),
          onTap: () {
            Navigator.pushNamed(context, Routes.order);
          },
        );
      },
    );
  }
}
