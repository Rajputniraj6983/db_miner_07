class QuotesModal
{
   String? quote ,author, type;
   QuotesModal({required this.author,required this.quote,required this.type});

   factory QuotesModal.fromJson(Map json)
   {
     return QuotesModal
       (
         author: json['author'],
         quote: json['quote'],
         type: json['type'],
     );
   }
}