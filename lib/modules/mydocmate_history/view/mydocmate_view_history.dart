import 'package:flutter/material.dart';
import 'package:flutter_interview/common/componenets/appBar.dart';
import 'package:flutter_interview/modules/mydocmate/common/bar_chart_sample5.dart';
import 'package:flutter_interview/modules/mydocmate_history/view_model/mydocmate_view_model_history.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:health/health.dart';
import 'package:intl/intl.dart';


class MydocmateViewHistory extends StatefulWidget {
  const MydocmateViewHistory({super.key});

  @override
  State<MydocmateViewHistory> createState() => _MydocmateViewHistoryState();
}

class _MydocmateViewHistoryState extends State<MydocmateViewHistory> {
  final viewModel = MydocmateViewModelHistory();
  String get stepsImg => 'assets/images/run-steps.png';
  String get calendar => 'assets/svgs/calendar.svg';
  String get calories => 'assets/svgs/calories.svg';
  String get speedkm => 'assets/svgs/speed-km.svg';
  List<Map>? weekData;

var now = DateTime.now();


@override
  void initState() {
    // TODO: implement initState
    super.initState();
    var startFrom = now.subtract(Duration(days: now.weekday));
    var list = List.generate(7, (i) => {
            "dayName": DateFormat.E().format(DateTime(now.year, now.month, startFrom.add(Duration(days: i)).day)),
            "dateValue": startFrom.add(Duration(days: i)).day,
      });
    weekData = list;
    print(list);
    fetchStepData(viewModel.dateSelect);
  }


  Future fetchStepData(dayValue) async{
  int? steps;
  HealthFactory health = HealthFactory(useHealthConnectIfAvailable: true);

  // define the types to get
  var types = [
    HealthDataType.STEPS,
    HealthDataType.DISTANCE_DELTA,
  ];
  // request permissions to write steps and blood glucose
  var permissions = [
      HealthDataAccess.READ_WRITE,
      HealthDataAccess.READ_WRITE
  ];
 bool requested = await health.requestAuthorization(types, permissions: permissions);
 
  var start = DateTime(now.year, now.month, dayValue);
  var endOf = DateTime(now.year, now.month, dayValue+1);

   if(requested){
    try {
      // get the number of steps for day of
      steps = await health.getTotalStepsInInterval(start, endOf);
    } catch(error){
         print("Caught exception");
    }

    print('Total number of steps day of: $steps');

    setState(() {
      viewModel.stepSet = (steps == null) ? 0 : steps;
      // viewModel.stepSet = getSteps;
    });
   }else{
    print("Authorization not granted");
   }
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBarView(),
      ),
      body: SafeArea(
        child: Observer(
          builder: (context) {
            return Padding(
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
                          border: Border.all(width: 1, color: const Color(0xff93b7d1)),
                          borderRadius: const BorderRadius.all(Radius.circular(8))
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 100,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: const Text(
                                'Day',textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Container(
                              width: 100,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                               decoration: const BoxDecoration(
                                color: Color(0xff93b7d1),
                                borderRadius: BorderRadius.all(Radius.circular(8))
                                ),
                              child: const Text(
                                'Week',textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300),
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
                                    child: Text('July 2023')),
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
                          height: 70,
                           child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: weekData?.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () { 
                                          setState(() {});
                                          fetchStepData(weekData?[index]['dateValue']);
                                          viewModel.dateSelect = weekData?[index]['dateValue'];
                                          viewModel.getDayFormat = weekData?[index]['dayName'];
                                          },
                                        child: Container(
                                        width: 40,
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.all(6),
                                          margin: const EdgeInsets.only(right: 6),
                                          decoration:  BoxDecoration(
                                          color: viewModel.dateSelect==weekData?[index]['dateValue'] ?
                                          const Color(0xff93b7d1):const Color(0xfffdd6c7),
                                          borderRadius:
                                              const BorderRadius.all(Radius.circular(10))),
                                          child:  Column(
                                            children: [
                                              Text(weekData?[index]['dayName'] ?? '', style: TextStyle(fontWeight: FontWeight.w300, color: viewModel.dateSelect==weekData?[index]['dateValue'] ? Colors.white: Colors.black),),
                                              Text(weekData?[index]['dateValue'].toString() ?? '', style: TextStyle(color: viewModel.dateSelect==weekData?[index]['dateValue'] ? Colors.white: Colors.black),),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 10,),
                                      const Text('Jul', style: TextStyle(fontWeight: FontWeight.w300),)
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
                              width: 105,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 8),
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
                                  Text(viewModel.stepSet.toString()),
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
                              width: 105,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 8),
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
                            width: 105,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 8),
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
                     BarChartSample4(step: viewModel.stepSet, getDayFormat:viewModel.getDayFormat)
                    ],
                  ),
                ));
          }
        ),
      ),
    
    );
  }
}
