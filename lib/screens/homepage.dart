import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:recreating_ovo/utils/custom_color.dart';
import 'package:recreating_ovo/utils/icon_button_data.dart';
import 'package:recreating_ovo/utils/rekomendasi_pilihan_data.dart';
import 'package:recreating_ovo/widgets/icon_button.dart';
import 'package:recreating_ovo/widgets/spacer.dart';
import 'package:recreating_ovo/widgets/white_text.dart';

import '../widgets/icon_with_label.dart';
import '../widgets/navbar_item.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool isHidden = false;
  final ScrollController _scrollController = ScrollController();
  int currentIndex = 0;

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels <= 10 && isHidden) {
        setState(() {
          isHidden = false;
        });
      } else if (_scrollController.position.pixels > 10 && !isHidden) {
        setState(() {
          isHidden = true;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,

      body: SafeArea(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 20,
                        child: Image.asset('assets/icons/logo.png'),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withAlpha(100),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.discount, color: mainColor),
                            SizedBox(width: 6),
                            Text(
                              'Promo',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: mainColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/header_bg.png'),
                    ),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.all(16),
                  width: double.infinity,
                  child: Stack(
                    children: [
                      AnimatedContainer(
                        curve: Curves.easeInOut,
                        duration: Duration(milliseconds: 200),
                        padding: EdgeInsets.only(
                          top:
                              isHidden
                                  ? MediaQuery.of(context).size.height * 0.01
                                  : MediaQuery.of(context).size.height * 0.11,
                        ),
                        child: AnimatedOpacity(
                          opacity: isHidden ? 0 : 1,
                          duration: Duration(
                            milliseconds: isHidden ? 100 : 500,
                          ),
                          curve: Curves.easeInOut,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconWithLabel(
                                icon: Icons.add_circle,
                                text: 'Top Up',
                                onTap: () {},
                              ),
                              IconWithLabel(
                                icon: Icons.upload,
                                text: 'Transfer',
                                onTap: () {},
                              ),
                              IconWithLabel(
                                icon: Icons.download,
                                text: 'Tarik Tunai',
                                onTap: () {},
                              ),
                              IconWithLabel(
                                icon: Icons.receipt_rounded,
                                text: 'History',
                                onTap: () {},
                              ),
                            ],
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/icons/logo.png',
                                height: 8,
                                color: Colors.white,
                              ),
                              horizontalSpacer(4),
                              whiteText(
                                'Cash',
                                fontSize: 10,
                                fontWeight: FontWeight.w300,
                              ),
                            ],
                          ),
                          verticalSpacer(12),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              whiteText(
                                'Total Saldo',
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                              ),
                              horizontalSpacer(8),
                              Icon(
                                Icons.visibility_off_outlined,
                                size: 14,
                                color: Colors.white,
                              ),
                            ],
                          ),
                          verticalSpacer(12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  whiteText(
                                    'Rp',
                                    fontSize: 8,
                                    fontWeight: FontWeight.w300,
                                  ),
                                  horizontalSpacer(4),
                                  whiteText(
                                    '200.000',
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                padding: EdgeInsets.fromLTRB(8, 4, 2, 4),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      'OVO Points',
                                      style: TextStyle(
                                        color: mainColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Icon(Icons.keyboard_arrow_right, size: 18),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                verticalSpacer(20),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: ListView(
                      controller: _scrollController,
                      children: [
                        GridView.builder(
                          padding: EdgeInsets.all(20),
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: iconButtonData.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                mainAxisExtent: 100,
                                mainAxisSpacing: 30,
                              ),
                          itemBuilder: (context, index) {
                            return CustomIconButton(
                              text: iconButtonData[index]['text'],
                              iconUrl: iconButtonData[index]['iconUrl'],
                              isBaru: iconButtonData[index]['isBaru'],
                              bgColor: iconButtonData[index]['colors'],
                            );
                          },
                        ),
                        Divider(color: Colors.grey.shade200, thickness: 8),
                        verticalSpacer(20),
                        CarouselSlider.builder(
                          options: CarouselOptions(
                            height: 150,
                            enableInfiniteScroll: false,
                            viewportFraction: 0.9,
                            onPageChanged: (index, reason) {
                              setState(() {
                                currentIndex = index;
                              });
                            },
                          ),
                          itemCount: 4,
                          itemBuilder: (context, index, realIndex) {
                            return Container(
                              margin: EdgeInsets.only(left: 10),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  'assets/images/long_promo_${index + 1}.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        ),
                        DotsIndicator(
                          dotsCount: 4,
                          animate: true,
                          position: currentIndex.toDouble(),
                          decorator: DotsDecorator(
                            spacing: EdgeInsets.symmetric(
                              horizontal: 4,
                              vertical: 12,
                            ),
                            activeSize: Size(18, 9),
                            color: Colors.grey.shade300,
                            activeColor: Colors.blue,
                            activeShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                        verticalSpacer(8),
                        Divider(color: Colors.grey.shade200, thickness: 8),
                        verticalSpacer(16),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text(
                            'Rekomendasi Pilihan',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        verticalSpacer(18),
                        SizedBox(
                          height: 220,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: rekomdendasiPilihanData.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                width: 200,
                                height: 220,
                                // color: Colors.red,
                                margin: EdgeInsets.only(left: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.asset(
                                        'assets/images/${rekomdendasiPilihanData[index]['imageUrl']}',

                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    verticalSpacer(8),
                                    Text(
                                      rekomdendasiPilihanData[index]['subtitle'],
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                      ),
                                    ),
                                    Text(
                                      rekomdendasiPilihanData[index]['title'],
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    verticalSpacer(8),
                                    Image.asset(
                                      'assets/icons/logo.png',
                                      height: 10,
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        verticalSpacer(100),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.07,
                    padding: EdgeInsets.fromLTRB(12, 0, 12, 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 12,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        NavBarItem(
                          icon: Icons.home,
                          label: 'Home',
                          color: mainColor,
                        ),
                        NavBarItem(
                          icon: Icons.monetization_on_rounded,
                          label: 'Finance',
                        ),
                        SizedBox.shrink(),
                        NavBarItem(icon: Icons.notifications, label: 'Inbox'),
                        NavBarItem(icon: Icons.person, label: 'Profile'),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: MediaQuery.of(context).size.width / 2 - 28,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Colors.deepPurple, mainColor],
                            ),
                          ),
                          child: Image.asset(
                            'assets/icons/qris.png',
                            height: 50,
                            color: Colors.white,
                          ),
                        ),
                        Text('qris'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
