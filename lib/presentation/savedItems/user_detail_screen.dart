import 'package:flutter/material.dart';
import 'package:flutter_project/AppProvider/ScreenProvider/DetailsProvider.dart';
import 'package:flutter_project/ResponseModel/ProviderDetailsByIdModel.dart'
    as providerModel;
import 'package:flutter_project/base/extensions/string_extensions.dart';
import 'package:flutter_project/data/constants/app_colors.dart';
import 'package:flutter_project/data/constants/app_string.dart';
import 'package:flutter_project/data/constants/responsive_view.dart';
import 'package:flutter_project/res/assets_res.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class UserDetailScreen extends StatefulWidget {
  final String? providerId;
  const UserDetailScreen({super.key, this.providerId});

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      context.read<DetailsProvider>().callViewProviderDetailByIdApi(
          context: context, providerId: widget.providerId.toString());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final response = ResponsiveCheck(context);
    return Consumer<DetailsProvider>(
      builder: (context, provider, child) {
        var node1;
        return Scaffold(
          appBar: response.isMobile
              ? AppBar(
                  leading: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        size: 21.0,
                        color: Colors.black,
                      )),
                  title: Text(
                    AppStrings.details,
                    style: TextStyle(
                        color: AppColors.blue,
                        fontSize: 26,
                        fontWeight: FontWeight.w700),
                  ),
                  centerTitle: true,
                  /*  actions: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.message,
                        color: AppColors.grey,
                      ),
                    )
                  ],*/
                )
              : AppBar(
                  leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 24,
                      color: Colors.black,
                    ),
                  ),
                  title: Text(
                    AppStrings.details,
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  /*actions: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.message,
                          color: AppColors.grey,
                        ))
                  ],*/
                ),
          body: response.isMobile || response.isTablet
              ? ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: response.isTablet ? 100 : 0,
                          vertical: 20),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.3,
                      // color: AppColors.grey,
                      child: Image.network(
                        provider.providerDetailsNodeList.first.providerId!
                            .profilePhoto
                            .toString(),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 25,
                          horizontal: response.isTablet ? 30 : 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              if (provider.providerDetailsNodeList.isEmpty)
                                Shimmer.fromColors(
                                  baseColor: Colors.grey[300]!,
                                  highlightColor: Colors.grey[100]!,
                                  child: Container(
                                    width: 200,
                                    height: 28,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                )
                              else
                                Text(
                                  provider.providerDetailsNodeList.first
                                          .providerId?.fullName?.capitalized ??
                                      "",
                                  style: TextStyle(
                                      color: AppColors.black,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600),
                              ),
                              if (provider.providerDetailsNodeList.isEmpty)
                                Shimmer.fromColors(
                                  baseColor: Colors.grey[300]!,
                                  highlightColor: Colors.grey[100]!,
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                )
                              else
                                IconButton(
                                  onPressed: () {
                                    if (provider.providerDetailsNodeList.isNotEmpty) {
                                      final providerId = provider.providerDetailsNodeList.first.providerId?.id;
                                      if (providerId != null) {
                                        if (provider.providerDetailsNodeList.first.isSaved == true) {
                                          provider.callRemoveFavouriteNodeApi(
                                            context: context,
                                            providerId: providerId,
                                          ).then((_) {
                                            setState(() {
                                              provider.providerDetailsNodeList.first.isSaved = false;
                                            });
                                          });
                                        } else {
                                          provider.callFavouriteNodeApi(
                                            context: context,
                                            providerId: providerId,
                                          ).then((_) {
                                            setState(() {
                                              provider.providerDetailsNodeList.first.isSaved = true;
                                            });
                                          });
                                        }
                                      }
                                    }
                                  },
                                  icon: Icon(
                                    provider.providerDetailsNodeList.first.isSaved == true
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                    color: provider.providerDetailsNodeList.first.isSaved == true
                                      ? Colors.red
                                      : AppColors.grey,
                                  ),
                                )
                            ],
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            "Jorem ipsum dolor, consectetur adipiscing elit. Nunc v libero et velit interdum, ac  mattis.Jorem ipsum dolor, consectetur adipiscing elit. Nunc v libero et velit interdum, ac  mattis.Jorem ipsum dolor, consectetur adipiscing elit. Nunc v libero et velit interdum, ac  mattis.",
                            style: TextStyle(
                                color: AppColors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          for (var node
                              in provider.providerDetailsNodeList.first.nodes!)
                            SubnodeComp(node: node),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    )
                  ],
                )
              : SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(34, 32, 88, 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 0,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 48),
                              height: MediaQuery.of(context).size.height * 0.4,
                              width: MediaQuery.of(context).size.width * 0.3,
                              decoration: BoxDecoration(
                                color: AppColors.grey1,
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  provider.providerDetailsNodeList.first
                                          .providerId?.fullName ??
                                      "",
                                  style: TextStyle(
                                      color: AppColors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "Exp 10 yrs",
                                  style: TextStyle(
                                      color: AppColors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 20),
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: Text(
                                    "Jorem ipsum dolor, consectetur adipiscing elit. Nunc v libero et velit interdum, ac  mattis.Jorem ipsum dolor, consectetur adipiscing elit. Nunc v libero et velit interdum, ac  mattis.Jorem ipsum dolor, consectetur adipiscing elit. Nunc v libero et velit interdum, ac  mattis.\n\nJorem ipsum dolor, consectetur adipiscing elit. Nunc v libero et velit interdum, ac  mattis.Jorem ipsum dolor, consectetur adipiscing elit. Nunc v libero et velit interdum, ac  mattis.Jorem ipsum dolor, consectetur adipiscing elit. Nunc v libero et velit interdum, ac  mattis.",
                                    style: TextStyle(
                                        color: AppColors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      AssetsRes.LOCATION_ICON,
                                      color: AppColors.black,
                                    ),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    Text(
                                      "Location",
                                      style: TextStyle(
                                          color: AppColors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      Expanded(
                        flex: 0,
                        child: Row(
                          children: [
                            for (var node in provider
                                .providerDetailsNodeList.first.nodes!)
                              SubnodeComp(node: node),
                            SizedBox(
                              width: 122,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}

class SubnodeComp extends StatelessWidget {
  final providerModel.Nodes
      node; // or createModel.Nodes depending on your usage

  const SubnodeComp({super.key, required this.node});

  @override
  Widget build(BuildContext context) {
    final response = ResponsiveCheck(context);
    return Container(
      width: response.isMobile
          ? MediaQuery.of(context).size.width
          : response.isTablet
              ? MediaQuery.of(context).size.width * 0.7
              : MediaQuery.of(context).size.width * 0.30,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Title : ${node.title}",
            style: TextStyle(
                color: AppColors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Description : ${node.addDescription?.capitalized}",
            style: TextStyle(
              color: AppColors.black,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            "Working Hr : ${node.addWorkHour}",
            style: TextStyle(
              color: AppColors.black,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          // Display images if available
          if (node.images != null && node.images!.isNotEmpty)
            SizedBox(
              height: 90,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: node.images!.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 10),
                    height: 200,
                    width: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(
                        color: AppColors.grey3,
                      ),
                    ),
                    child: Image.network(
                      node.images![index],
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
          const SizedBox(
            height: 32,
          ),
        ],
      ),
    );
  }
}
