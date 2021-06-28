import 'package:common/arch/domain/model/form_data.dart';
import 'package:common/arch/domain/model/img_data.dart';
import 'package:common/res/string/_string.dart';
import 'package:common/value/const_values.dart';

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
      FormData(key: "key1", question: "question 1.2.3", type: FormType.check,
        options: [
          FormOption(label: "opsi 1", isSelected: false),
          FormOption(label: "opsi 2", isSelected: false),
          FormOption(label: "opsi 3", isSelected: true),
          FormOption(label: "opsi 3", isSelected: false),
        ],
      ),
      FormData(key: "key2",
        question: "Pada waktu bayi telentang, apakah ia dapat mengikuti gerakan anda dengan menggerakkan kepalanya dari kanan/kiri ke tengah?",
        type: FormType.radio,
        options: [
          FormOption(label: "opsi 1", isSelected: true),
          FormOption(label: "opsi 2", isSelected: true),
        ],
        img: [
          ImgData(link: "pic_baby_head_side_to_middle.png", package: "bayiku", isLocal: true),
        ],
      ),
      FormData(key: "key3", question: "question 3", type: FormType.text, options: [
        FormOption(label: "opsi 1", isSelected: true),
        FormOption(label: "opsi 2", isSelected: false),
        FormOption(label: "opsi 3", isSelected: true),
      ],
        answer: "halo bun"
      ),
      FormData(key: "key4", question: "question 4", type: FormType.check, options: [
        FormOption(label: "opsi 1", isSelected: false),
        FormOption(label: "opsi 2", isSelected: false),
        FormOption(label: "opsi 3", isSelected: true),
        FormOption(label: "opsi 3", isSelected: false),
      ]),
    ],
  ),
];
va(){
}

final motherFormGroupData = <FormGroupData>[
  FormGroupData(
    header: "Form Pemeriksaan Bunda",
    data: [
      FormData(key: Const.KEY_VISIT_DATE, question: Strings.visit_date, type: FormType.text,),
      FormData(key: Const.KEY_VISIT_PLACE, question: Strings.visit_place, type: FormType.text,),
      FormData(key: Const.KEY_CHECKER_NAME, question: Strings.checker_name, type: FormType.text,),
      FormData(key: Const.KEY_MOTHER_DIFFICULTY, question: Strings.mother_difficulty, type: FormType.text,),
      FormData(key: Const.KEY_PREGNANCY_AGE, question: Strings.pregnancy_age, type: FormType.text,),
      FormData(key: Const.KEY_BABY_GENDER, question: Strings.baby_gender, type: FormType.text,),
      FormData(key: Const.KEY_FUTURE_VISIT_DATE, question: Strings.future_visit_date, type: FormType.text,),
      FormData(key: Const.KEY_HPHT, question: Strings.hpht, type: FormType.text,),
      FormData(key: Const.KEY_HPL, question: Strings.hpl, type: FormType.text,),
      FormData(key: Const.KEY_MOTHER_WEIGHT, question: Strings.mother_weight, type: FormType.text,),
      FormData(key: Const.KEY_MOTHER_WEIGHT_DIFF, question: Strings.mother_weight_diff, type: FormType.text,),
      FormData(key: Const.KEY_MOTHER_HEIGHT, question: Strings.mother_height, type: FormType.text,),
      FormData(key: Const.KEY_TFU, question: Strings.tfu, type: FormType.text,),
      FormData(key: Const.KEY_DJJ, question: Strings.djj, type: FormType.text,),
      FormData(key: Const.KEY_SYSTOLIC_PRESSURE, question: Strings.systolic_pressure, type: FormType.text,),
      FormData(key: Const.KEY_DIASTOLIC_PRESSURE, question: Strings.diastolic_pressure, type: FormType.text,),
      FormData(key: Const.KEY_MAP, question: Strings.map, type: FormType.text,),
      FormData(key: Const.KEY_BABY_MOVEMENT, question: Strings.baby_movement, type: FormType.text,),
      FormData(key: Const.KEY_DRUG_PRESCRIPT, question: Strings.drug_prescript, type: FormType.text,),
      FormData(key: Const.KEY_DRUG_ALLERGY, question: Strings.drug_allergy, type: FormType.text,),
      FormData(key: Const.KEY_DISEASE_HISTORY, question: Strings.disease_history, type: FormType.text,),
      FormData(key: Const.KEY_SPECIAL_NOTE, question: Strings.special_note, type: FormType.text,),
    ],
  ),
];

final pregnancyImmunizationFormGroupData = <FormGroupData>[
  FormGroupData(
    header: "Konfirmasi Imunisasi",
    data: [
      FormData(key: Const.KEY_IMMUNIZATION_DATE, question: Strings.immunization_date, type: FormType.text,),
      FormData(key: Const.KEY_IMMUNIZATION_PLACE, question: Strings.immunization_place, type: FormType.text,),
      FormData(key: Const.KEY_RESPONSIBLE_NAME, question: Strings.responsible_name, type: FormType.text,),
    ],
  ),
];
final babyImmunizationFormGroupData = <FormGroupData>[
  FormGroupData(
    header: "Konfirmasi Imunisasi",
    data: [
      FormData(key: Const.KEY_IMMUNIZATION_DATE, question: Strings.immunization_date, type: FormType.text,),
      FormData(key: Const.KEY_IMMUNIZATION_PLACE, question: Strings.immunization_place, type: FormType.text,),
      FormData(key: Const.KEY_RESPONSIBLE_NAME, question: Strings.responsible_name, type: FormType.text,),
      FormData(key: Const.KEY_NO_BATCH, question: Strings.no_batch, type: FormType.text,),
    ],
  ),
];