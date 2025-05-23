String formatName({required String first, String? last, String title = 'Mr'}){
  return '$title. $first ${last??''}' ;
}
