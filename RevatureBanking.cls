public class RevatureBanking {
    //updates status field to overdrawn and creates new transaction
    public static void status ()
    {
        
        
        List<Account> a =  new List<Account>();
        List<Transaction__c> TT = new List<Transaction__c>();
        
        a = [Select Id, name,status__c, Balanace__c, Transactions__c  
            From Account
            Where status__c =  'Good' OR status__c = null];
        for(integer i = 0; i < a.size(); i++)
        {
            a[i].Status__c = 'overdrawn';
            Transaction__c t1 = new Transaction__c();
            a[i].Transactions__c  = t1.ID;
            if(t1.Deposit__c >= 0)
            {
               // a[i].Balanace__c  += t1.Deposit__c;
             //   TT[i] = new Transaction__c();
            }
            else
            {
              //  a[i].Balanace__c  -= t1.Withdrawl__c;
                //TT[i] = new Transaction__c();
            }
        }
        
        upsert a;
        
    }
    
    public static void Transact()
    {
       List<Transaction__c> t2 = new List<Transaction__c>();
        t2 = [Select name, withdrawl__c, deposit__c, Account_Owner__c	
             From Transaction__c
             ];
        for(integer i = 0; i<t2.size(); i++)
        {
        if(t2[i].Deposit__c >= 0)
        {
         //   t2[i].Account__r.Balance__c+=t2[i].Deposit__c;
        }
            
        }
    }
   

}