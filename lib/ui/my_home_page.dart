import 'package:catfacts/blocs/facts_bloc.dart';
import 'package:catfacts/blocs/facts_event.dart';
import 'package:catfacts/blocs/facts_state.dart';
import 'package:catfacts/ui/all_facts_page.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    keywords: <String>['foo', 'bar','baby','cats','cat','funny','facts','animal'],
    childDirected: true,
    nonPersonalizedAds: true,
  );

  BannerAd _bannerAd;
  BannerAd _bannerAd1;
  InterstitialAd _interstitialAd;


  InterstitialAd createInterstitialAd() {
    return InterstitialAd(
      adUnitId: "ca-app-pub-8263707630270675/7410285887",
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        print("InterstitialAd event $event");
      },
    );
  }

  BannerAd createBannerAd() {
    return BannerAd(

      adUnitId: "ca-app-pub-8263707630270675/8581388012",
      size: AdSize.banner,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
      },
    );
  }
  BannerAd createBannerAd1() {
    return BannerAd(
      adUnitId: "ca-app-pub-8263707630270675/7601857572",
      size: AdSize.banner,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
      },
    );
  }


  @override
  void initState() {
    _interstitialAd??=createInterstitialAd();
    _bannerAd ??= createBannerAd();
    _bannerAd1 ??= createBannerAd1();

    _bannerAd..load()..show(anchorOffset: 0);
    _bannerAd1..load()..show(anchorOffset: 50,anchorType: AnchorType.top);
    // TODO: implement initState
    super.initState();
  }

  @override

  Widget build(BuildContext context) {

    final _factsBloc = BlocProvider.of<FactsBloc>(context);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),

      body: Container(
        child: BlocBuilder<FactsBloc,FactsState>(
          builder: (context,state){
            if (state is TrendingLoadedState){
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  Center(child: Text(state.randomFacts.text.toString(),textAlign:TextAlign.center,style: TextStyle(color: Colors.white,fontSize:25))),
                  FloatingActionButton(

                    child: Icon(Icons.refresh),

                    onPressed: (){
                      _factsBloc..add(AppStarted());

                    },
                  ),
                  GestureDetector(
                    onTap: (){
                      _interstitialAd..load()..show();
                      _bannerAd1..dispose();
                      _bannerAd..dispose();


                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AllFactsPage()),
                      );

                    },
                    child: Chip(

                      label: Text("See ALL",style: TextStyle(fontSize: 20),),
                    ),
                  ),
                ],
              );
            }
            return Center(child: CircularProgressIndicator());

          },

        ),

      ),
    );
  }
}
