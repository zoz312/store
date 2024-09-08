import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storapp/models/Product_model.dart';
import 'package:storapp/services/Allproducts.dart';
import 'package:storapp/views/pages/cubit/getallproduct_cubit.dart';
import 'package:storapp/views/widgets/Product.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetallproductCubit()..fatchdata(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Icon(Icons.arrow_back),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.shopping_bag_rounded),
            ),
          ],
          title: Text('New Trend'),
          centerTitle: true,
        ),
        body: Container(
            margin: EdgeInsets.all(10),
            child: BlocBuilder<GetallproductCubit, GetallproductState>(
              builder: (context, state) {
                if (state is Getallproduclaoded) {
                  return  GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) =>
                       Material(
      elevation: 10,
      borderRadius: BorderRadius.circular(8.0), // إضافة زوايا مستديرة
      child: Container(
        height: 130,
        width: 120,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0), // نفس زوايا Material
        ),
        child: MaterialButton(
          onPressed: () {
            print('object');
          },
          child: Stack(
            children: [
              Positioned(
                  right: 42,
                  top: 10,
                  child: Image.network(
                    state.productCard[index].image,
                    height: 80,
                    width: 80,
                  )),
              Positioned(
                bottom: 40,
                left: 8,
                child: Text(
                 state.productCard[index].title.toString(),
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Positioned(
                bottom: 8,
                left: 8,
                right: 8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(state.productCard[index].price.toString()),
                    Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    )
                  );
                 
                } else if (state is Getallproduclaoded) {
                  return Center(child: Text('no internet'));
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                  ;
                }
              },
            )),
      ),
    );
  }
}
