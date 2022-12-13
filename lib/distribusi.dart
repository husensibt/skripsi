import 'package:flutter/material.dart';
import 'package:skripsi/home_page.dart';
import 'package:skripsi/main.dart';
import 'package:skripsi/model/color_pallete.dart';

class distribusi extends StatefulWidget {
  _distribusi createState() => _distribusi();
}

class _distribusi extends State<distribusi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                homepage(username: username)));
                  },
                  icon: Icon(Icons.arrow_back_ios),
                ),
                Text(
                  'Distribusi Matakuliah',
                  style: TextStyle(
                      color: Colors.black38,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),

                //Row(
                // children: [

                // ListTile(
                //title: Text('Mata Kuliah'),
                //),
                //ListTile(
                // title: Text('Nilai'),
                // ),
                //ListTile(
                //title: Text('Keterangan'),
                //),
                //],
                // )
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colorpallete.myarSekunder,
              ),
              child: RaisedButton(
                elevation: 5,
                onPressed: () {},
                padding: EdgeInsets.all(3),
                child: Icon(Icons.edit),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                color: colorpallete.myarSekunder,
              ),
            ),
          ),
          ListTile(
              title: Text('Algoritma 1'),
              trailing: Wrap(
                children: [
                  Text(
                    '3',
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'A',
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text('LULUS'),
                ],
              )
              //Wrap(
              //children: [
              //DropdownButton(
              //  hint: Text('Nilai'),
              // value: selected,
              // items: data.map((e) {
              // return DropdownMenuItem(
              //  child: Text(e),
              //  value: e,
              // );
              // }).toList(),
              //  onChanged: (val) {
              //  setState(() {
              //   print(val);
              //  selected = val as String;
              //});
              // }),
              //],
              //)

              )
        ],
      ),
    );
  }
}
