import 'package:common/arch/domain/model/form_data.dart';
import 'package:common/arch/domain/model/img_data.dart';

final babyFormGroupData = <FormGroupData>[
  FormGroupData(
    header: "Yuk cek",
    data: [
      FormData(key: "key1", question: "question 1", type: FormType.text,),
      FormData(key: "key2", question: "question 2", type: FormType.radio, options: [
        FormOption(label: "opsi 1", isSelected: false),
        FormOption(label: "opsi 2", isSelected: false),
      ]),
      FormData(key: "key3", question: "question 3", type: FormType.check, options: [
        FormOption(label: "opsi 1", isSelected: true),
        FormOption(label: "opsi 2", isSelected: false),
        FormOption(label: "opsi 3", isSelected: true),
      ]),
    ],
  ),
  FormGroupData(
    header: "Yuk cek ke 2",
    data: [
      FormData(key: "key1", question: "question 1", type: FormType.text,),
      FormData(key: "key2",
        question: "Pada waktu bayi telentang, apakah ia dapat mengikuti gerakan anda dengan menggerakkan kepalanya dari kanan/kiri ke tengah?",
        type: FormType.radio,
        options: [
          FormOption(label: "opsi 1", isSelected: true),
          FormOption(label: "opsi 2", isSelected: true),
        ],
        img: [
          ImgData(link: "pic_baby_head_side_to_middle.png", /*package: "bayiku",*/ isLocal: true),
        ],
      ),
      FormData(key: "key3", question: "question 3", type: FormType.text, options: [
        FormOption(label: "opsi 1", isSelected: true),
        FormOption(label: "opsi 2", isSelected: false),
        FormOption(label: "opsi 3", isSelected: true),
      ]),
      FormData(key: "key4", question: "question 4", type: FormType.check, options: [
        FormOption(label: "opsi 1", isSelected: false),
        FormOption(label: "opsi 2", isSelected: false),
        FormOption(label: "opsi 3", isSelected: true),
        FormOption(label: "opsi 3", isSelected: false),
      ]),
    ],
  ),
];