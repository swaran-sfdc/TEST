public  class CreatedDateController {
   
    @AuraEnabled
    public static Account getCreatedDateFromAccount(){
        try {
            return [SELECT Id,Name,CreatedDate,CreatedById,CreatedBy.Name FROM Account WHERE Id ='0015i00000kzN4jAAE'];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}