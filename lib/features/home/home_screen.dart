import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:hrm_aqtech/common/widgets/header/circular_container.dart';
import 'package:hrm_aqtech/common/widgets/header/primary_header_container.dart';
import 'package:hrm_aqtech/common/widgets/images/image_text_image.dart';
import 'package:hrm_aqtech/common/widgets/texts/section_heading.dart';
import 'package:hrm_aqtech/features/leave_day_management/views/leave_day_list/leave_day_list_screen.dart';
import 'package:hrm_aqtech/features/employee_management/views/employee_list/employee_list_screen.dart';
import 'package:hrm_aqtech/features/home/widgets/home_appbar.dart';
import 'package:hrm_aqtech/features/online_work_management/views/online_work_day_list/online_work_day_list_screen.dart';
import 'package:hrm_aqtech/features/over_time_management/views/over_time_list/over_time_list_screen.dart';
import 'package:hrm_aqtech/features/time_off_management/views/general_time_off/general_time_off_screen.dart';
import 'package:hrm_aqtech/utils/constants/colors.dart';
import 'package:hrm_aqtech/utils/constants/image_paths.dart';
import 'package:hrm_aqtech/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MyPrimaryHeaderContainer(
                child: Column(
              children: [
                MyHomeAppBar(),
                SizedBox(
                  height: MySizes.spaceBtwItems,
                ),
                Padding(
                  padding: EdgeInsets.all(MySizes.defaultSpace),
                  child: Card(
                    color: Colors.white,
                    elevation: 4,
                    child: Padding(
                      padding: EdgeInsets.all(MySizes.md),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MySectionHeading(
                              textColor: MyColors.dartPrimaryColor,
                              title: "Kết quả định lượng công việc trong năm"),
                          SizedBox(
                            height: MySizes.spaceBtwItems,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.workspace_premium_sharp,
                                color: MyColors.secondaryTextColor,
                              ),
                              Expanded(
                                child: Text(
                                  'Tổng số ngày làm việc trong tuần (cố định):',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(
                                width: MySizes.spaceBtwItems,
                              ),
                              MyCicularContainer(
                                width: 25,
                                height: 25,
                                child: Center(child: Text("2")),
                              )
                            ],
                          ),
                          SizedBox(
                            height: MySizes.spaceBtwItems,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.lock_clock,
                                color: MyColors.secondaryTextColor,
                              ),
                              Expanded(
                                child: Text(
                                  'Tổng số giờ làm việc trong ngày (Theo cá nhân):',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(
                                width: MySizes.spaceBtwItems,
                              ),
                              MyCicularContainer(
                                width: 25,
                                height: 25,
                                child: Center(child: Text("2")),
                              )
                            ],
                          ),
                          SizedBox(
                            height: MySizes.spaceBtwItems,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.beach_access,
                                color: MyColors.secondaryTextColor,
                              ),
                              Expanded(
                                child: Text(
                                  'Tổng số ngày nghỉ phép cá nhân, lễ, tết, nghỉ chung:',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(
                                width: MySizes.spaceBtwItems,
                              ),
                              MyCicularContainer(
                                width: 25,
                                height: 25,
                                child: Center(child: Text("2")),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MySizes.spaceBtwSections,
                )
              ],
            )),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: MySizes.defaultSpace),
              child: Column(
                children: [
                  MySectionHeading(
                    title: "Danh sách nhân viên",
                    showActionButton: true,
                    onPressed: () {
                      Get.to(const EmployeeListScreen());
                    },
                  ),
                  const Divider(),
                  const MySectionHeading(title: "Quản lý ngày nghỉ"),
                  Card(
                    color: Colors.white,
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(MySizes.sm),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          MyVerticalImageText(
                              image: MyImagePaths.iconParty,
                              title: "Ngày nghỉ\n chung",
                              onTap: () {
                                Get.to(const GeneralTimeOffScreen());
                              }),
                          MyVerticalImageText(
                              image: MyImagePaths.iconPlane,
                              title: "Ngày công\n tác",
                              onTap: () {
                                
                              }),
                          MyVerticalImageText(
                              image: MyImagePaths.iconBeach,
                              title: "Ngày nghỉ\n phép",
                              onTap: () {
                                Get.to(const LeaveDayListScreen());
                              }),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: MySizes.spaceBtwSections,
                  ),
                  const MySectionHeading(title: "Quản lý làm việc"),
                  Card(
                    color: Colors.white,
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(MySizes.sm),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          MyVerticalImageText(
                              image: MyImagePaths.iconLaptop,
                              title: "Làm việc\n online",
                              onTap: () {
                                Get.to(const OnlineWorkDayListScreen());
                              }),
                          MyVerticalImageText(
                              image: MyImagePaths.iconOT,
                              title: "Làm việc\n ngoài giờ",
                              onTap: () {
                                Get.to(const OverTimeListScreen());
                              }),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: MySizes.spaceBtwSections,
                  ),
                  const MySectionHeading(title: "Báo cáo thống kê"),
                  Card(
                    color: Colors.white,
                    elevation: 4,
                    child: SizedBox(
                      width: double.infinity,
                      height: 200,
                      child: GridView.count(
                        padding: const EdgeInsets.all(0),
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 4,
                        children: [
                          MyVerticalImageText(
                              image: MyImagePaths.iconEmployee,
                              title: "Nhân sự\n AQ",
                              onTap: () {}),
                          MyVerticalImageText(
                              image: MyImagePaths.iconLunch,
                              title: "Tiền ăn\n trưa",
                              onTap: () {}),
                          MyVerticalImageText(
                              image: MyImagePaths.iconCase,
                              title: "Tiền công\n tác phí",
                              onTap: () {}),
                          MyVerticalImageText(
                              image: MyImagePaths.iconSleepy,
                              title: "Làm việc\n ngoài giờ",
                              onTap: () {}),
                          MyVerticalImageText(
                              image: MyImagePaths.iconCalender,
                              title: "Nghỉ phép\n năm",
                              onTap: () {}),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
