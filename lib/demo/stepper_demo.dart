import 'package:flutter/material.dart';

class StepperDemo extends StatefulWidget {
  @override
  _StepperDemoState createState() => _StepperDemoState();
}

class _StepperDemoState extends State<StepperDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StepperDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //? 用Theme 来覆盖掉 应用的部分主题的配置
            Theme(
              data: Theme.of(context).copyWith(
                primaryColor: Colors.green,
              ),
              child: Stepper(
                steps: [
                  Step(
                    title: Text('Login'),
                    subtitle: Text('Login first'),
                    content: Text('Ut ullamco minim excepteur dolor amet proident ea deserunt.'),
                    isActive: true,
                  ),
                  Step(
                    title: Text('Choose Plan'),
                    subtitle: Text('Choose you plan'),
                    content: Text('Duis fugiat adipisicing ex cupidatat amet ut deserunt sint occaecat ullamco dolor dolor eu.'),
                    isActive: true,
                  ),
                  Step(
                    title: Text('Confirm payment'),
                    subtitle: Text('Comfirm you payment method.'),
                    content: Text('Culpa fugiat anim amet commodo pariatur proident Lorem.'),
                    isActive: true,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}