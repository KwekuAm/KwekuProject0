public class ProjectZero {
    //number 1 Return the nth Fibonacci number
    
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
public static Integer nFactorial(Integer n) {
        if(n <= 1)
            return 1;

        return nFactorial(n - 1) * n;
    }
    
    //number 4. Rotate left
    
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
    

}