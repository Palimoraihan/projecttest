import 'package:flutter/material.dart';
import 'package:github_app/favorite_screen.dart';
import 'package:github_app/model/model.dart';
import 'package:github_app/provider/provider.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  TextEditingController controllertxt = TextEditingController();
  @override
  Widget build(BuildContext context) {
    
    final myprof = Provider.of<MyProvider>(context);
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width*0.80,
                  child: TextField(
                    controller: controllertxt,
                    onChanged: myprof.searchData,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40)),
                        hintText: 'Search repository'),
                  ),
                ),
                IconButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return Favorite();
                }));
                }, icon: Icon(Icons.favorite))
              ],
            ),
            SizedBox(
              height: 30,
            ),
            if (myprof.search.length != 0 || controllertxt.text.isNotEmpty)
              ListView.builder(
                  itemCount: myprof.search.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    ItemM dataItem = myprof.search[index];
                    return Card(
                        child: Container(
                      padding: EdgeInsets.all(10),
                      child: Stack(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              dataItem.name != null
                                  ? Text(
                                      '${dataItem.name}',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 73, 156, 224),
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    )
                                  : Text('kosong'),
                              SizedBox(
                                height: 5,
                              ),
                              Text('${dataItem.owner}'),
                              SizedBox(
                                height: 10,
                              ),
                              Text('${dataItem.description}'),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.remove_red_eye_outlined,
                                        size: 20,
                                        color: Colors.amber,
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text('${dataItem.whaches}'),
                                    ],
                                  ),
                                  Text(
                                    '${dataItem.language}',
                                    style: TextStyle(color: Colors.grey),
                                  )
                                ],
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(onPressed: (){
                                
                                myprof.addToDb(dataItem.name.toString());
                                
                              }, icon: Icon(Icons.favorite),)
                              
                            ],
                          ),
                        ],
                      ),
                    ));
                  })
            else
              Center(
                child: Text('No Search'),
              )
          ],
        ),
      )),
    );
  }
}
