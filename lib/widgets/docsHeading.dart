import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:west_road/values.dart';

class DocumentsHead extends StatelessWidget {
  const DocumentsHead({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(
          Icons.description,
          color: AppColors.btnColor,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          'Documents',
          style: TextStyle(
            color: AppColors.btnColor,
          ),
        ),
      ],
    );
  }
}

class AppFormNotGranted extends StatelessWidget {
  const AppFormNotGranted({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Application Form not granted',
          style: TextStyle(fontSize: 15),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          margin: EdgeInsets.only(bottom: 20, top: 10),
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.status,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ],
    );
  }
}

class ProvisionalAllotment extends StatefulWidget {
  const ProvisionalAllotment({
    Key? key,
  }) : super(key: key);

  @override
  State<ProvisionalAllotment> createState() => _ProvisionalAllotmentState();
}

class _ProvisionalAllotmentState extends State<ProvisionalAllotment> {
  TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.status,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
        child: Column(
          children: [
            const TextField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                labelText: 'Doc name',
              ),
            ),
            const TextField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                labelText: 'Uploaded by',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.datetime,
              onTap: (() async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(3000),
                );
                if (pickedDate != null) {
                  setState(() {
                    _dateController.text = DateFormat(
                      'dd-MM-yyyy',
                    ).format(
                      pickedDate,
                    );
                  });
                }
              }),
              controller: _dateController,
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.calendar_month),
                hintText: '11/01/22',
              ),
            ),
            const TextField(
              maxLength: 10,
              maxLines: 2,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                labelText: 'Courier',
              ),
            ),
            const TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Tracking No.',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomerAdhar extends StatelessWidget {
  const CustomerAdhar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Customer Aadhaar not receiver',
          style: TextStyle(fontSize: 15),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          margin: EdgeInsets.only(bottom: 20, top: 10),
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.status,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RaisedButton(
                color: AppColors.btnColor,
                onPressed: (() {}),
                child: Text(
                  'Browse',
                  style: TextStyle(
                    color: AppColors.btmSocial,
                  ),
                ),
              ),
              RaisedButton(
                color: AppColors.btnColor,
                onPressed: (() {}),
                child: Text(
                  'Upload',
                  style: TextStyle(
                    color: AppColors.btmSocial,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
