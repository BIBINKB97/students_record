import 'package:flutter/material.dart';
import 'package:student_records/utils/colors.dart';
import 'package:student_records/utils/constants.dart';
import 'package:student_records/view/view_details/widgets/custom_container.dart';

class ViewDetails extends StatefulWidget {
  const ViewDetails({super.key});

  @override
  State<ViewDetails> createState() => _ViewDetailsState();
}

class _ViewDetailsState extends State<ViewDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
        centerTitle: true,
        backgroundColor: ktheme,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            kheight30,
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('images/user.png'),
                radius: 80,
              ),
            ),
            kheight30,
            Container(
              height: 365,
              width: 350,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: ktheme),
              child: Column(
                children: [
                  kheight10,
                  CustomContainer(
                    keyText: 'Name ',
                    valueText: 'bibin',
                  ),
                  kheight10,
                  CustomContainer(
                    keyText: 'Age ',
                    valueText: '25',
                  ),
                  kheight10,
                  CustomContainer(
                    keyText: 'Domain',
                    valueText: 'Flutter',
                  ),
                  kheight10,
                  CustomContainer(
                    keyText: 'Batch',
                    valueText: 'Bck 87',
                  ),
                  kheight20,
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(kwhite)),
                    onPressed: () {},
                    child: Text(
                      'Edit',
                      style: TextStyle(color: kblack, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
