import 'package:flutter/material.dart';
import 'package:flutter_project/AppProvider/ScreenProvider/addressProvider.dart';
import 'package:flutter_project/base/helpers/textwidget.dart';
import 'package:flutter_project/data/constants/app_colors.dart';
import 'package:flutter_project/presentation/widgets/app_button.dart';
import 'package:provider/provider.dart';

class AutoCompleteScreen extends StatefulWidget {
  static const routeName = "/auto_complete_screen";

  const AutoCompleteScreen({super.key});

  @override
  State<AutoCompleteScreen> createState() => _AutoCompleteScreenState();
}

class _AutoCompleteScreenState extends State<AutoCompleteScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<AddressProvider>(context, listen: false).init();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AddressProvider>(
      builder: (context, addressValue, child) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(Icons.arrow_back, color: AppColors.white)),
            backgroundColor: AppColors.blue,
            title: Center(
              child: TextWidget(
                text: "Add Address",
                color: AppColors.white,
              ),
            ),
            // toolbarHeight: 45.0,
          ),
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              addressValue.buildGoogleMap(),
              addressValue.placesAutoCompleteTextField(),
            ],
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: AppButton(
              backgroundColor: AppColors.blue,
              textColor: AppColors.white,
              title: 'Save',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.white),
              onPressed: () {
                final address = addressValue.address;
                final latitude = addressValue.latitude;
                final longitude = addressValue.longitude;

                Navigator.pop(context, {
                  'address': address,
                  'latitude': latitude,
                  'longitude': longitude,
                });
              },
              height: 55,
              width: 0.0,
            ),
          ),
        );
      },
    );
  }
}
