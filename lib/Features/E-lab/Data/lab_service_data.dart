import 'package:dermabyte/Core/utils/assets.dart';

class LabServiceData {
  String title;
  String subTitle;
  String image;

  LabServiceData(
      {
      required this.title,
      required this.image,
      required this.subTitle});

  static List<LabServiceData> labServices() {
    return [
      LabServiceData(
        title: 'Blood test',
        subTitle: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.' ,
        image: Assets.kBloodTestIcon,

      ),
      LabServiceData(
        title: 'Sugar test',
        subTitle: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        image: Assets.kSugarTestIcon,
      ),
      LabServiceData(
        title: 'Virus test',
        subTitle:'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        image: Assets.kVirusTestIcon,
        
      ),
      LabServiceData(
        title: 'X-ray & Scan',
        subTitle: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.' ,
        image: Assets.kXrayTestIcon,
        
      ),
    ];
  }
}
