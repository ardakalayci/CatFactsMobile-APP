import 'package:catfacts/blocs/facts_bloc.dart';
import 'package:catfacts/blocs/facts_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllFactsPage extends StatefulWidget {
  @override
  _AllFactsPageState createState() => _AllFactsPageState();
}

class _AllFactsPageState extends State<AllFactsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      body:  BlocBuilder<FactsBloc,FactsState>(
        builder: (context,state){
          if (state is TrendingLoadedState){
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                  Flexible(
                    flex: 1,
                    child: Container(


                      child: ListView.builder(
                          itemCount: state.allfacts.all.length,
                          itemBuilder: (context,i){

                            return  Column(
                              children: [
                                ListTile(
                                  subtitle: Text(state.allfacts.all[i].user.name.first.toString()),
                                  hoverColor: Colors.white,
                                  focusColor: Colors.white,
                                  title: Text(state.allfacts.all[i].text,style: TextStyle(),),

                                ),
                            Divider(),
                              ],
                            );

                          }),
                    ),
                  )

              ],
            );
          }
          return Center(child: CircularProgressIndicator());

        },

      ),
    );
  }
}
