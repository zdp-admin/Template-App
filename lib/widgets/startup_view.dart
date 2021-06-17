import 'package:template/models/startup_view_model.dart';
import 'package:template/providers/startup_view_provider.dart';
import 'package:flutter/material.dart';

class StartUpView extends StatelessWidget {
  const StartUpView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return StartUpViewProvider<StartUpViewModel>.withConsumer(
        viewModel: StartUpViewModel(),
        onModelReady: (model) => model.handleStartUp(),
        builder: (context, model, child) => Scaffold(
              backgroundColor: Colors.yellow[600],
              body: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 30),
                      child: Center(
                        child: Image(
                          image: AssetImage('assets/images/YourLogoHere1.png'),
                          width: _size.width * .6,
                        ),
                      ),
                    ),
                    Container(
                      child: CircularProgressIndicator(
                        strokeWidth: 5,
                        valueColor: AlwaysStoppedAnimation(Colors.red),
                      ),
                    )
                  ],
                ),
              ),
            ));
  }
}
