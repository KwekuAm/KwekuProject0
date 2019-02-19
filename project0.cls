public class Project0Questions {
   
    //number 1 Return the nth Fibonacci number
    //
    //
    
   public static Integer nFibonacci(Integer n){
        Integer first = 0;
        Integer second = 1;
        Integer third;

        if(n == 0)
            return first;
        else if(n == 1)
            return second;
        else if(n > 1){
            for(Integer i = 2; i <= n; ++i){
                third = first + second;
                first = second;
                second = third;
            }
            return third;
        }else
            return null;
    }
    
    
    // number 2. Sort Array
    // 
    // 
public static Integer[] sortArray(Integer[] intList) {
        for(Integer i = 0; i < intList.size(); i++){
            for(Integer j = 0; j < intList.size() - i - 1; j++){
                if(intList[j] > intList[j + 1]){
                    Integer temp = intList[j];
                    intList[j] = intList[j + 1];
                    intList[j + 1] = temp;
                }
            }
        }
        return intList;
    }
    
    
    //number 3. Return the Factorial
    //
    //
public static Integer nFactorial(Integer n) {
        if(n <= 1)
            return 1;

        return nFactorial(n - 1) * n;
    }
    
   
    //number 4. Rotate left
    //
    //
    
    public static Integer[] rotateLeftNTimes(Integer[] array1, Integer n) { 
        integer temp;

            for (integer i = 0; i < n; i++)
            {
                temp = array1[0];

                for (integer j = 0; j < array1.size()-1; j++) 
                {
                    array1[j] = array1[j+1];
                }

                array1[array1.size() - 1] = temp;
            }

        return array1;
        }
    // number 5 Balance Brackets
    // 
    // 
    
    public static Boolean bracketsAreBalanced( String s ) 
    {
       
List<Integer> stack = new List<Integer>(s.length());
        
    Integer a = 0;

    for(Integer i = 0; i < s.length(); i++) {
        switch on s.charAt(i) {
            // Put all open brackets in the stack
            when 40, 91, 123 
            {
                stack[a++] = s.charAt(i);
            }

            //check if there's a matching bracket at the top of the stack
         
            when 41 
            {
                if (a <= 0)
                {
                    return false;
                }
                if (stack[--a] != 40)
                {
                    return false;
                }
                else
                {
                    stack[a] = null;
                }
            }
            when 93 {
                if (a <= 0)
                {
                    return false;
                }
                if (stack[--a] != 91)
                {
                    return false;
                }
                else
                {
                    stack[a] = null;
                }
            }
            when 125 {
                if (a <= 0)
                {
                    return false;
                }
                if (stack[--a] != 123)
                {
                    return false;
                }
                else
                {
                    stack[a] = null;
                }
            }

            // Ignore all other characters, e.g. ( a [ xyz ] ji ) is effectively ([])
            when else {

            }
        }
    }
    // If theres unmatched open brackets, then the string is unbalanced
    if (a > 0)
        return false;
    return true;
}
    

    
    // number 6 Create a method that retrieves a list of all accounts and updates those accounts.
    // 
    // 
    
    public static void status()
    {
        
        List<Account> t = new List<Account>();
        
       t= [ Select id, size__c, NumberOfEmployees 
           From Account];
        
           for(integer i = 0; i< t.size(); i++)
           {
               if(t[i].NumberOfEmployees < 1000 )
               {
                   t[i].size__c = 'Small';
               }
               
               if(t[i].NumberOfEmployees > 1000 && t[i].NumberOfEmployees < 10000  )
               {
                   t[i].size__c = 'Medium';
               }
               
               if(t[i].NumberOfEmployees > 10000 )
               {
                   t[i].size__c = 'Large';
               }
               
           }
        
        upsert t;
    }
    
    // number 7 Create a method that will find all leads that contain 'ca' in their fields.
    // 
    // 
    public static void updateCALeads( ) 
    {
        List<Lead> L = new List<Lead>();
        
        L = [Select id, status, address
            from Lead
             where state = 'CA'
            ];
            for(Integer i = 0; i<L.size(); i++)
            {
             L[i].Status = 'Closed - Not';
             L[i].Description = 'We are no longer doing business in California.';
               
            }
        
        upsert L;
    }
	
	//number 8 Create a method that will find all Opportunities which have already passed their Close Date


    public static void closePastDueOpportunities()
    {
        List<Opportunity> Op = new List<Opportunity>();
       
            Op = [Select id, StageName, CloseDate
                 From Opportunity
                 Where StageName != 'Closed Won'And CloseDate > Today];
        
        for(Integer i = 0; i<Op.size(); i++)
        {
            Op[i].StageName = 'Closed Lost';
        }
        
        upsert Op;
        
    }
