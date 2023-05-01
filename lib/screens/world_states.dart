import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStatePage extends StatefulWidget {
  const WorldStatePage({super.key});

  @override
  State<WorldStatePage> createState() => _WorldStatePageState();
}

class _WorldStatePageState extends State<WorldStatePage>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 10),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  final colorList = <Color>[
    Color(0xff4285F4),
    Color(0xff1aa260),
    Color(0xffde5246),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            PieChart(
              dataMap: {
                "Total": 20,
                "Recovered": 15,
                "Deaths": 20,
              },
              animationDuration: Duration(milliseconds: 1200),
              chartType: ChartType.ring,
              colorList: colorList,
              chartRadius: MediaQuery.of(context).size.width / 2.5,
              legendOptions: LegendOptions(legendPosition: LegendPosition.left),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * .06),
              child: Card(
                child: Column(
                  children: [
                    ReusableRow(title: 'Total Cases', value: ""),
                    ReusableRow(title: 'Deaths', value: ""),
                    ReusableRow(title: 'Recovered', value: ""),
                    ReusableRow(title: 'Active', value: ""),
                    ReusableRow(title: 'Critical', value: ""),
                    ReusableRow(
                      title: 'Today Deaths',
                      value: "",
                    ),
                    ReusableRow(title: 'Today Recovered', value: ""),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => const CountriesListScreen()));
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Color(0xff1aa260),
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
                  child: Text('Track Countries'),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}

class ReusableRow extends StatelessWidget {
  String title, value;
  ReusableRow({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(title), Text(value)],
          ),
          SizedBox(
            height: 5,
          ),
          Divider()
        ],
      ),
    );
  }
}
