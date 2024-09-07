import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var wtController =  TextEditingController();
  var ftController =  TextEditingController();
  var inController =  TextEditingController();

  var result = "";
  var bgColor;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme
              .of(context)
              .colorScheme
              .inversePrimary,

          title: Text('your BMI'),
        ),
        body: Container(
          color: bgColor,
          child: Center(
            child: Container(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("BMI",
                  style: TextStyle( fontSize: 34,fontWeight:FontWeight.w700),),
                  TextField(
                    controller:wtController,
                    decoration: InputDecoration(
                      label: Text('Enter your weight in Kgs'),
                      prefixIcon: Icon(Icons.line_weight)
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 21,),
                  TextField(
                    controller:ftController,
                    decoration: InputDecoration(
                        label: Text('Enter your height in Feets'),
                        prefixIcon: Icon(Icons.height),

                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 21,),
                  TextField(
                    controller: inController,
                    decoration: InputDecoration(
                      label: Text('Enter your height in inches'),
                      prefixIcon: Icon(Icons.height),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 21,),

                  ElevatedButton(onPressed: (){
                    var wt = wtController.text.toString();
                    var ft = ftController.text.toString();
                    var inch = inController.text.toString();
                    if (wt!=""&&ft!=""&&inch!=""){
                      var iWt = double.parse(wt);
                      var iFt = int.parse(ft);
                      var iInch = int.parse(inch);
.25.
                      var tInch = (iFt*12) + iInch;

                      var tCm = tInch*2.54;

                      var tM = tCm/100;

                      var bmi = iWt/(tM*tM);
                      var msg = '';
                      if (bmi>25){
                        msg = " You are overweight!!";
                        bgColor = Colors.orange.shade200;
                      } else if(bmi<18){
                        msg = ' You are Underweight!!';
                        bgColor = Colors.red.shade200;
                      }
                      else{
                        msg = ' You are Healthy!!';
                        bgColor = Colors.green.shade200;

                      }

                      setState(() {
                        result = "$msg \n Your BMI is: ${bmi.toStringAsFixed(2)}";
                      });
                    //   BMI Calculation
                    }
                    else{
                      setState(() {
                        result = "Please fill all the required fields!!";
                      });
                    }
                  }, child: Text('Calculate'),
                  ),

                  SizedBox(height: 21,),

                  Text(result,style: TextStyle(fontSize: 21),),

                ],
              ),
            ),
          ),
        )
    );
  }
}
