using System; 
public class Bubble_Sort  
{  
   public static void Main(string[] args)
         { 
            int[] a = { 4, 9, 7, 5, 8, 9, 3 }; 
			int t;
	   		int j=0;
			Console.WriteLine("Original array :");
            foreach (int aa in a)                       
            Console.Write(aa + " ");                     
            for (int p = 0; p <= a.Length - 2; p++)
            {
				Console.Write("\n");
				int k = p+1;
				Console.WriteLine("proses swap ke" + k);
				foreach (int aa in a)                       
            	Console.Write(aa + " ");   
                for (int i = 0; i <= a.Length - 2; i++)
                {
                    if (a[i] > a[i + 1])
                    {
                        t = a[i + 1];
                        a[i + 1] = a[i];
                        a[i] = t;
						j=j+1;
                    } 
                } 
            }
            Console.WriteLine("\n"+"Sorted array :");
            foreach (int aa in a)                       
            Console.Write(aa + " ");
			Console.Write("\n");
	   		Console.Write("Jumlah swap");
	   		Console.Write("\n"+j);
        }
}