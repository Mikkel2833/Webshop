package dk.mmj;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class ShoppingBasket implements Serializable
{
   private static final long serialVersionUID = 1L;
		
   private List<Item> items = new ArrayList<Item>();
   private double totalValue = 0.0;
   //private int count = 0;
   
	
   public void addToBasket(Item item)
   {
	  Boolean added = false;
	  for(Item i : items)
	  {
		  if((i.getName()).contains(item.getName()))
		  {
			  i.addCount();
			  //totalValue += i.getPrice();
			  //i.addCount();
			  added = true;
		  }
	  }
	  if(added == false)
	  {
		  items.add(item);
		  //totalValue += item.getPrice();
	  }
	  totalValue += item.getPrice();
   }
	
   public List<Item> getItems()
   {
      return items;
   }
	
   public double getTotalValue()
   {
      return totalValue;
   }
}
