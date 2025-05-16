public class UserTriggerHandler {
	
    public void onBeforeInsert(List<User> newUserList){
        
        Map<Id,Profile> mapOfIdProfile = new Map<Id,Profile>([SELECT Id,Name FROM Profile]);
		for(User u :newUserList){
            if(u.Department =='EA012' && mapOfIdProfile.containsKey(u.ProfileId) && mapOfIdProfile.get(u.ProfileId).Name =='System Administrator'){
                u.User_Type__c ='Admin';
            }
            
        }
       
        
    }
    
    public void onBeforeUpdate(List<User> newUserList){
        
    }
    
    public void onAfterInsert(List<User> newUserList){
        List<PermissionSetAssignment> permissionSetList = new List<PermissionSetAssignment>();
        list<GroupMember> groupList = new list<GroupMember>();
        Id ACM_PS_ID =[SELECT Id FROM PERMISSIONSET WHERE NAME ='ACM'].Id;
        Id ACM_GRP_ID =[SELECT Id FROM Group WHERE NAME ='ACM Group'].Id;
        for(User u :[SELECT Id,Name FROM USER WHERE ID IN :newUserList AND User_Type__c='Admin']){
            PermissionSetAssignment psa = new PermissionSetAssignment (PermissionSetId = ACM_PS_ID, AssigneeId = u.Id);
    		permissionSetList.add(psa);
            
            GroupMember gm = new GroupMember(groupId =ACM_GRP_ID , UserOrGroupId =u.Id);
            groupList.add(gm);
        }
        if(permissionSetList.size() >0){
            insert permissionSetList;
        }
        
        if(groupList.size()>0){
            insert groupList;
        }
        
    }
    
    public void onAfterUpdate(List<User> newUserList){
        
    }
}