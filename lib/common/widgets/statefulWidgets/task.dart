import'package:flutter/material.dart';

class Task extends StatelessWidget {
  bool isGrid;
  Task({Key key,this.isGrid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      child: isGrid ? GridView.builder(padding: EdgeInsets.all(8),gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 10,
        mainAxisExtent: 150,
        childAspectRatio: 1/3,
        crossAxisSpacing: 10,
        crossAxisCount: 2
      ), itemCount: 10,itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blue[100],
          ),
          child: Text("This is ${index}"),
        );
      },) : Column(
        children: [
          Expanded(
            child: ListView.builder(itemCount: 10,itemBuilder: (context, index) {
              return Container(
                width:double.infinity,
                height: 50,
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.teal),
                  borderRadius: BorderRadius.circular(5)
                ),
                child: _taskWidget(index,false),
              );
            },),
          ),
          SizedBox(height: 15,child: Divider(height: 1,thickness: 2,)),
          Expanded(
            child: ListView.builder(itemCount: 10,itemBuilder: (context, index) {
                return Container(
                  width:double.infinity,
                  height: 50,
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: _taskWidget(index,true),
                );
              },),
          ),
        ],
      )
    );
  }

  Row _taskWidget(int index, bool isCompleted) {
    return Row(
      children: [
        Checkbox(value: isCompleted, onChanged: (value)=>{}),
        Text("This is ${index}"),
      ],
    );
  }
}