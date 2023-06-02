import 'package:flutter/material.dart';

import '../model/userdataResponseModel.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    Key? key,
    this.userData,
  }) : super(key: key);

  final List<Data>? userData;
  @override
  Widget build(BuildContext context) {
    if (userData == null) {
      return const Center(
          child: SizedBox(
              height: 200, width: 200, child: Text("No items to show")));
    }
    return SizedBox(
        height: MediaQuery.of(context).size.height * 1,
        child: ListView.builder(
            itemCount: userData!.length,
            itemBuilder: (BuildContext context, int index) {
              final item = userData![index];
              return GestureDetector(
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 7, 15, 5),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const[
                          BoxShadow(
                            color: Colors.blue,
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Card(
                        elevation: 0.0,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(item.employeeName.toString()),
                                  Text(item.employeeAge.toString()),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
                onTap: () {},
              );
            }));
  }
}
