import 'dart:ui';

import 'package:appconcept/constants/const.dart';
import 'package:appconcept/utils/screen_size.dart';
import 'package:appconcept/views/widgets/widgets.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int count = 1;
  int selectedCupSize = 1;
  int selectedSugarCubes = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Column(
        children: [
          _itemView(),
          Expanded(
            child: SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _itemPrice(),
                        _addItemWidget(),
                      ],
                    ),
                    SizedBox(height: 20),
                    _cupSizeWidget(),
                    SizedBox(height: 20),
                    _sugarCubeWidget(),
                    SizedBox(height: 40),
                    AppButton(
                      label: 'Add to Cart',
                      onPressed: () {},
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _itemView() {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.backgroundColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.15),
                blurRadius: 5,
                offset: Offset(1, 8),
              ),
            ],
          ),
          child: Opacity(
            opacity: 0.05,
            child: Container(
              height: ScreenSize.size.height * 0.4,
              width: ScreenSize.size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppAssets.background),
                  fit: BoxFit.cover,
                ),
              ),
              alignment: Alignment.center,
            ),
          ),
        ),
        SafeArea(
          child: Container(
            height: ScreenSize.size.height * 0.4,
            child: Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 5),
                  leading: Material(
                    type: MaterialType.transparency,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      color: Colors.black,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  title: Center(
                    child: Text(
                      'Macchiato',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        letterSpacing: letterSpacing,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  trailing: SizedBox(width: 45),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: Column(
                    children: [
                      Image.asset(
                        AppAssets.macchiato,
                        height: 120,
                        width: 120,
                        filterQuality: FilterQuality.high,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _itemPrice() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Macchiato',
          style: TextStyle(
            fontSize: 15,
            letterSpacing: letterSpacing,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 5),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '\u20B9',
              style: TextStyle(
                color: AppColors.primaryColor,
                letterSpacing: letterSpacing,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 3),
            Text(
              '210',
              style: TextStyle(
                fontSize: 25,
                color: AppColors.primaryColor,
                letterSpacing: letterSpacing,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _addItemWidget() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CounterButton.left(
          icon: Icons.remove,
          onPressed: () {
            setState(() {
              if (count != 1) {
                count--;
              }
            });
          },
        ),
        SizedBox(
          height: 30,
          width: 40,
          child: Center(
            child: Text(
              '$count',
              style: TextStyle(
                fontSize: 16,
                letterSpacing: 1,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        CounterButton.right(
          icon: Icons.add,
          onPressed: () {
            setState(() {
              count++;
            });
          },
        ),
      ],
    );
  }

  Widget _cupSizeWidget() {
    List sizes = [
      {'image': AppAssets.miniCap, 'size': 28.0},
      {'image': AppAssets.bigCap, 'size': 40.0},
      {'image': AppAssets.bigCap, 'size': 55.0},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Size',
          style: TextStyle(
            fontSize: 15,
            letterSpacing: letterSpacing,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 5),
        Row(
          children: List.generate(
            sizes.length,
            (index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    selectedCupSize = index;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 70,
                      width: 60,
                      padding: EdgeInsets.all(5),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Opacity(
                          opacity: selectedCupSize == index ? 1 : 0.4,
                          child: Image.asset(
                            sizes[index]['image'],
                            height: sizes[index]['size'],
                            width: sizes[index]['size'],
                            filterQuality: FilterQuality.high,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 3,
                      width: 15,
                      margin: EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                        color: selectedCupSize == index
                            ? AppColors.primaryColor
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _sugarCubeWidget() {
    List sugarCubes = [
      {'image': AppAssets.noSugar, 'size': 25.0},
      {'image': AppAssets.oneSugar, 'size': 18.0},
      {'image': AppAssets.twoSugar, 'size': 35.0},
      {'image': AppAssets.threeSuagr, 'size': 35.0},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        RichText(
          text: TextSpan(
              text: 'Sugar',
              style: TextStyle(
                fontSize: 15,
                fontFamily: fontFamily,
                color: Colors.black,
                letterSpacing: letterSpacing,
                fontWeight: FontWeight.w500,
              ),
              children: [
                WidgetSpan(child: SizedBox(width: 5)),
                TextSpan(
                  text: '(In Cubes)',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black45,
                    fontFamily: fontFamily,
                    letterSpacing: letterSpacing,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ]),
        ),
        SizedBox(height: 5),
        Row(
          children: List.generate(
            sugarCubes.length,
            (index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    selectedSugarCubes = index;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 50,
                      width: 70,
                      padding: EdgeInsets.all(5),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Opacity(
                          opacity: selectedSugarCubes == index ? 1 : 0.4,
                          child: Image.asset(
                            sugarCubes[index]['image'],
                            height: sugarCubes[index]['size'],
                            width: sugarCubes[index]['size'],
                            filterQuality: FilterQuality.high,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 3,
                      width: 15,
                      margin: EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                        color: selectedSugarCubes == index
                            ? AppColors.primaryColor
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
