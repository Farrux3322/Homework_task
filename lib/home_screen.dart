import 'package:flutter/material.dart';
import 'package:grid_view/item.dart';
import 'package:grid_view/repository.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      appBar: AppBar(
        backgroundColor: Colors.black45,
        toolbarHeight: 120,
        elevation: 0,
        title: const Row(
          children: [
            SizedBox(width: 20,),
            Text("Find Your \nFavorite Food",style: TextStyle(fontSize: 36,fontWeight: FontWeight.w600,color: Colors.white),),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10,),
          const Row(
            children: [
              SizedBox(width: 20,),
              Text("Popular Restaurant",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600,color: Colors.white),),
            ],
          ),
          const SizedBox(height: 10,),
          Expanded(child: GridView(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.all(20),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              childAspectRatio: 0.8,
            ),
            children:List.generate(MyRepository.data.length, (index){
              Item item = MyRepository.data[index];
              return Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.pinkAccent,
                ),
                child: Column(
                  children: [
                    Image.asset(item.image,height: 120,),
                    const SizedBox(height: 8,),
                    Text(item.title,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.white),),
                    const SizedBox(height: 6,),
                    Text(item.subtitle,style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.pink),),
                  ],
                ),
              );
            })
          ))
        ],
      ),
    );
  }
}
