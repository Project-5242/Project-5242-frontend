import 'package:flutter/material.dart';
import 'package:flutter_project/base/base.dart';

class SelectCategoryView extends StatefulWidget {
  const SelectCategoryView({super.key});

  @override
  State<SelectCategoryView> createState() => _SelectCategoryViewState();
}

class _SelectCategoryViewState extends State<SelectCategoryView> {
  List<bool> _selectedItems = [];

  @override
  void initState() {
    super.initState();
    // Initialize the list with the desired length and default value
    _selectedItems = List.generate(9, (index) => false); // Assuming 10 items
  }

  @override
  Widget build(BuildContext context) {
    final sized = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Choose Your Category',
          style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w700,
              color: AppColors.darkBlue,
              fontFamily: Fonts.fontsOpenSans),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40),
            Center(
              child: Container(
                width: sized.width * 0.75,
                padding: const EdgeInsets.only(bottom: 60, top: 10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.borderColor.withOpacity(0.3),
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: _selectedItems.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      minTileHeight: 45,
                      minVerticalPadding: 0,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 0),
                      horizontalTitleGap: 0,
                      leading: Transform.scale(
                        scale: 1.3,
                        child: Checkbox(
                          value: _selectedItems[index],
                          checkColor: AppColors.black, // Color of the checkmark
                          fillColor: WidgetStatePropertyAll(AppColors.white),

                          side: WidgetStateBorderSide.resolveWith(
                            (Set<WidgetState> states) {
                              if (states.contains(WidgetState.selected)) {
                                return BorderSide(
                                    color: AppColors.black.withOpacity(0.2),
                                    width: 1); // Red border when checked
                              }
                              return BorderSide(
                                color: AppColors.black.withOpacity(0.2),
                              ); // No border when unchecked
                            },
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                1), // Optional: Add rounded corners
                          ),
                          onChanged: (value) {
                            setState(() {
                              _selectedItems[index] = value!;
                            });
                          },
                        ),
                      ),
                      title: Text(
                        'Category ${index + 1}',
                        style: TextStyle(
                          fontFamily: Fonts.fontsOpenSans,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 60),
            AppButton(
              width: sized.width * 0.85,
              height: 60,
              radius: 10,
              backgroundColor: AppColors.darkBlue,
              title: "Sign Up",
              style: TextStyle(
                fontFamily: Fonts.fontsOpenSans,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.white,
              ),
              onPressed: () {},
            ),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
