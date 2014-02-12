package dk.mmj;

import java.io.Serializable;

public class Item implements Serializable
{
      private static final long serialVersionUID = 1L;
	
      private String name;
      private double price;
//      private double pricemoreitems;
      private int count;
      private int id;
      
      public Item(String name, double price, int id, int count)
      {
         this.name = name;
         this.price = price;
         this.id = id;
         this.count = count;
      }

      public String getName()
      {
         return this.name;
      }

      public double getPrice()
      {
    	  return this.price * count;
    	  //return this.price;
      }
      public int getId()
      {
    	  return id;
      }
      
      public int getCount()
      {
    	  return count;
      }
      
      public void addCount()
      {
    	  count = count + 1;
      }
}
