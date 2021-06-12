import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meditation_app/constants.dart';
import 'package:meditation_app/subScreenDiet/session1.dart';
import 'package:meditation_app/subScreenDiet/session2.dart';
import 'package:meditation_app/subScreenDiet/session3.dart';
import 'package:meditation_app/subScreenDiet/session4.dart';
import 'package:meditation_app/widgets/bottom_nav_bar.dart';
//import 'package:meditation_app/widgets/search_bar.dart';

class DietRecomendation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .28,
            decoration: BoxDecoration(
              color: kBlueLightColor,
              image: DecorationImage(
                image: AssetImage("assets/images/diet_bg.png"),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    Text(
                      "Diet \nRecomendation",
                      style: Theme.of(context)
                          .textTheme
                          // ignore: deprecated_member_use
                          .display1
                          .copyWith(fontWeight: FontWeight.w900),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: size.width * .6, // it just take 60% of total width
                      child: Text(
                        "Hidup sehat dengan menerapkan rekomendasi diet yang telah kami buat berdasarkan riset para ahli \n",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      children: <Widget>[
                        SeassionCard(
                          //session1
                          seassionNum: 1,
                          isDone: true,
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return IntermittentFasting();
                              }),
                            );
                          },
                        ),
                        SeassionCard(
                          //session2
                          seassionNum: 2,
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return DietVegan();
                              }),
                            );
                          },
                        ),
                        SeassionCard(
                          //session3
                          seassionNum: 3,
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return DietVegetarian();
                              }),
                            );
                            },
                        ),
                        SeassionCard(
                          //session4
                          seassionNum: 4,
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return DietMediterani();
                              }),
                            );
                          },
                        ),
                        SeassionCard(
                          //session5
                          seassionNum: 5,
                          press: () {},
                        ),
                        SeassionCard(
                          //session6
                          seassionNum: 6,
                          press: () {},
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Diet Recomendation",
                      style: Theme.of(context)
                          .textTheme
                          // ignore: deprecated_member_use
                          .title
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SeassionCard extends StatelessWidget {
  final int seassionNum;
  final bool isDone;
  final Function press;
  const SeassionCard({
    Key key,
    this.seassionNum,
    this.isDone = false,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Container(
          width: constraint.maxWidth / 2 -
              10, // constraint.maxWidth provide us the available with for this widget
          // padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(13),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 17),
                blurRadius: 23,
                spreadRadius: -13,
                color: kShadowColor,
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: press,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 42,
                      width: 43,
                      decoration: BoxDecoration(
                        color: isDone ? kBlueColor : Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: kBlueColor),
                      ),
                      child: Icon(
                        Icons.play_arrow,
                        color: isDone ? Colors.white : kBlueColor,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Session $seassionNum",
                      // ignore: deprecated_member_use
                      style: Theme.of(context).textTheme.subtitle,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}