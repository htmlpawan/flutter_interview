import 'package:flutter/material.dart';
import 'package:flutter_interview/common/componenets/appBar.dart';
import 'package:flutter_interview/modules/mydocmate/common/bar_chart_sample5.dart';
import 'package:flutter_interview/modules/mydocmate/common/line_chart.dart';
import 'package:flutter_svg/flutter_svg.dart';


class MydocmateViewHistory extends StatefulWidget {
  const MydocmateViewHistory({super.key});

  @override
  State<MydocmateViewHistory> createState() => _MydocmateViewHistoryState();
}

class _MydocmateViewHistoryState extends State<MydocmateViewHistory> {
  String get stepsImg => 'assets/images/run-steps.png';
  String get calendar => 'assets/svgs/calendar.svg';
  String get calories => 'assets/svgs/calories.svg';
  String get speedkm => 'assets/svgs/speed-km.svg';
  List<Map> weekData = [
    {
        "dayName": "Mon",
        "dateValue": "05"
    },
    {
        "dayName": "Tue",
        "dateValue": "06"
    },
    {
        "dayName": "Wed",
        "dateValue": "07"
    },
    {
        "dayName": "Thu",
        "dateValue": "08"
    },
    {
        "dayName": "Fri",
        "dateValue": "09"
    },
    {
        "dayName": "Sat",
        "dateValue": "10"
    }
];
int dateSelect = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBarView(),
      ),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Color(0xff93b7d1)),
                      borderRadius: BorderRadius.all(Radius.circular(8))
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 100,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          decoration: const BoxDecoration(
                            color: Color(0xff93b7d1),
                            borderRadius: BorderRadius.all(Radius.circular(8))
                            ),
                          child: const Text(
                            'Day',textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Container(
                          width: 100,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: const Text(
                            'Week',textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.w300),
                          ),
                        ),
                        Container(
                          width: 100,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: const Text(
                            'Month',textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                   Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Select Dates'),
                          Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: Text('June 2021')),
                              SvgPicture.asset(
                                calendar,
                                width: 20,
                                height: 20,
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 20,),
                     SizedBox(
                      height: MediaQuery.of(context).size.height*0.10,
                       child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: weekData.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: [
                                  GestureDetector(
                                    onTap: () { 
                                      setState(() {});
                                      dateSelect = index;
                                      },
                                    child: Container(
                                    width: 50,
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.all(8),
                                      margin: const EdgeInsets.only(right: 10),
                                      decoration:  BoxDecoration(
                                      color: dateSelect==index ?
                                      Color(0xff93b7d1):Color(0xfffdd6c7),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10))),
                                      child:  Column(
                                        children: [
                                          Text(weekData[index]['dayName'] ?? '', style: TextStyle(fontWeight: FontWeight.w300, color: dateSelect==index ? Colors.white: Colors.black),),
                                          Text(weekData[index]['dateValue'] ?? '', style: TextStyle(color: dateSelect==index ? Colors.white: Colors.black),),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10,),
                                  const Text('Apr', style: TextStyle(fontWeight: FontWeight.w300),)
                                ],
                              );
                            }
                          ),
                     ),

                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          width: 110,
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          decoration: const BoxDecoration(
                              color: Color(0xfffdd6c7),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Column(
                            children: [
                              Image.asset('assets/images/run-steps.png',
                              width: 60,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text('2078'),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'Steps',
                                style: TextStyle(fontWeight: FontWeight.w300),
                              ),
                            ],
                          )),
                     
                      Container(
                          width: 110,
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          decoration: const BoxDecoration(
                              color: Color(0xff93b7d1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Column(
                            children: [
                              SvgPicture.asset(
                                calories,
                                width: 50,
                                height: 50,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                '42',
                                style: TextStyle(color: Colors.white),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'Calories',
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white),
                              ),
                            ],
                          )),
                      Container(
                        width: 110,
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        decoration: const BoxDecoration(
                            color: Color(0xffc9eee6),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              speedkm,
                              width: 50,
                              height: 50,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text('1.0'),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Speed kmph',
                              style: TextStyle(fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                const Text('Steps'),
                 BarChartSample4(step: 300,)
                ],
              ),
            )),
      ),
    
    );
  }
}
