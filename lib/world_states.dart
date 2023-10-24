import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStatesScreen extends StatefulWidget {
  const WorldStatesScreen({super.key});

  @override
  State<WorldStatesScreen> createState() => _WorldStatesScreenState();
}

class _WorldStatesScreenState extends State<WorldStatesScreen> with TickerProviderStateMixin{

  late final AnimationController _controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this)..repeat();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
  final colorList =<Color>[
    const Color(0xff4285F4),
    const Color(0xff1aa260),
    const Color(0xffde5246),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
            PieChart(
                dataMap:{
                  'Total':52.4,
                  'Recover':46.6,
                  'Deaths':1.0
                },
              chartRadius: MediaQuery.of(context).size.width / 2.3,
              legendOptions: const LegendOptions(
                legendPosition: LegendPosition.left
              ),
              animationDuration: Duration(milliseconds: 3200),
              chartType: ChartType.ring,
              colorList: colorList,
                ),
            Padding(
              padding:  EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.01, horizontal: MediaQuery.of(context).size.width * 0.02),
              child: Card(child: Column(
                children: [
                    ReuseableRow(title: 'Total', value: '283429292'),
                  ReuseableRow(title: 'Deaths', value: '5434331'),
                  ReuseableRow(title: 'Recovered', value: '252081976'),
                  ReuseableRow(title: 'Active', value: '25912985'),
                  ReuseableRow(title: 'Critical', value: '89257'),
                  ReuseableRow(title: 'Today Deaths', value: '3440'),
                  ReuseableRow(title: 'Today Recovered', value: '273542'),
                ],
              ),),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.02),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xff1aa260),
                  borderRadius: BorderRadius.circular(50)
                ),
                child: const Center(
                  child: Text('Track Countries'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ReuseableRow extends StatelessWidget {
  String title, value;
   ReuseableRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15,right: 15,top: 15,bottom: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Text(value),
            ],
          ),
          SizedBox(height: 5,),
          Divider(),
        ],
      ),
    );
  }
}
