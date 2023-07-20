import 'package:flutter/material.dart';
import 'package:flutter_interview/common/componenets/appBar.dart';
import 'package:flutter_interview/modules/mydocmate/common/bar_chart_sample5.dart';
import 'package:flutter_interview/modules/mydocmate/view_model/mydocmate_view_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:health/health.dart';

class MydocmateView extends StatefulWidget {
  const MydocmateView({super.key});

  @override
  State<MydocmateView> createState() => _MydocmateViewState();
}

class _MydocmateViewState extends State<MydocmateView> {
  final viewModel = MydocmateViewModel();
  String get stepsImg => 'assets/svgs/steps.svg';
  String get km => 'assets/svgs/km.svg';
  String get calories => 'assets/svgs/calories.svg';
  String get speedkm => 'assets/svgs/speed-km.svg';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  int getSteps = 0;

  HealthFactory health = HealthFactory();

  Future fetchStepData() async{
   int? steps;

  // create a HealthFactory for use in the app, choose if HealthConnect should be used or not
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

  // write steps and blood glucose
  var now = DateTime.now();
  
  var midnight = DateTime(now.year, now.month, now.day);
   if(requested){
    try {
      // get the number of steps for today
      steps = await health.getTotalStepsInInterval(midnight, now);
    } catch(error){
         print("Caught exception");
    }

    print('Total number of steps: $steps');

    setState(() {
      getSteps = (steps == null) ? 0 : steps;
      viewModel.stepSet = getSteps;
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                                bottom: 5,
                                left: 8,
                                right: 8 // Space between underline and text
                                ),
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                              color: Color(0xff93b7d1),
                              width: 1.5, // Underline thickness
                            ))),
                            child:  const Text(
                              'Steps',
                              style: TextStyle(
                                  color: Color(0xff93b7d1),
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          const Text('Water'),
                          const Text('Sleep')
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            decoration: const BoxDecoration(
                                color: Color(0xff93b7d1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                            child: const Text(
                              'Google - Fit Data',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              viewModel.switchValue = !viewModel.switchValue;
                              if(viewModel.switchValue != true){
                                fetchStepData();
                              }
                            },
                            child: Container(
                              width: 50,
                              margin: const EdgeInsets.only(left: 15),
                              padding: const EdgeInsets.all(3.0),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: const Color(0xff93b7d1)),
                                  color: Colors.white,
                                  borderRadius:
                                      const BorderRadius.all(Radius.circular(50))),
                              child: Row(
                                mainAxisAlignment: viewModel.switchValue
                                    ? MainAxisAlignment.end
                                    : MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: viewModel.switchValue
                                          ? const Color(0xff93b7d1)
                                          : Colors.green,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(
                            stepsImg,
                            width: 100,
                            height: 100,
                          ),
                           Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(viewModel.stepSet.toString(),
                                style: const TextStyle(
                                    fontSize: 40, fontWeight: FontWeight.w800),
                              ),
                              const Text('Steps', style: TextStyle(fontSize: 20)),
                            ],
                          )
                        ],
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
                                  SvgPicture.asset(
                                    km,
                                    width: 50,
                                    height: 50,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(viewModel.activitySet.toString()),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    'km',
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
                                  Text(
                                    viewModel.caloriesSet.toString(),
                                    style: const TextStyle(color: Colors.white),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Daily Activity Trend'),
                          GestureDetector(
                            onTap: () =>
                                GoRouter.of(context).pushNamed('mydocmate-history'),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: const Color(0xff93b7d1)),
                                  borderRadius:
                                      const BorderRadius.all(Radius.circular(50))),
                              child: const Text(
                                'View History',
                                style: TextStyle(
                                    color: Color(0xff93b7d1),
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20,),
                      BarChartSample4(step: viewModel.stepSet, getDayFormat:viewModel.getDayFormat)
                    ],
                  ),
                ));
          }
        ),
      ),
     
      floatingActionButton: Observer(
        builder: (context) {
          return InkWell(
            onTap: () => {
              showCustomDialog(context, viewModel),
            },
            child: 
            viewModel.switchValue ?
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 20),
              decoration: const BoxDecoration(
                  color: Color(0xff93b7d1),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  )),
              child:  const Text(
                'Log My Steps',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500),
              ),
            ) : const SizedBox(height: 0,),
          );
        }
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

void showCustomDialog(BuildContext context, viewModel) {
  TextEditingController steps = TextEditingController();
  TextEditingController activity = TextEditingController();
  TextEditingController calories = TextEditingController();
  
  showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      insetPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      title: const Text('Add steps and calories'),
      content: SizedBox(
        height: 10,
        width: MediaQuery.of(context).size.width - 30,
      ),
      actions: <Widget>[
             Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                   TextField(
              controller: steps,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter steps',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: activity,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter Activity',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: calories,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter calories',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                viewModel.stepSet = int.parse(steps.text);
                viewModel.activitySet = double.parse(activity.text);
                viewModel.caloriesSet = int.parse(calories.text);
                viewModel.setStepPreferences();
                Navigator.pop(context);
              },
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.blue, borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: const Text(
                  'Save',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            )
                ],
              ),
            )
         
       
      ],
    ),
  );
}
