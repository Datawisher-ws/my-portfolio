menu <- c("Hawaiian", "Seafood cocktail", "Double cheese")
price <- c(379, 439, 299)

chatbot <- function() {
  totalCost <- 0
  
  while (TRUE) {
    
    order <- readline("What would you like to order today? ")
    
    if (order %in% menu) {
      itemPrice <- price[menu == order]
      print(paste("Price is ", itemPrice))
      totalCost <- totalCost + itemPrice
      
      while (TRUE) {
        
        additional <- readline("Would you like to add anything else? ")
        
        if (additional == "no") {
          break
        } else if (additional %in% menu) {
          itemPrice <- price[menu == additional]
          print(paste("Price is ", itemPrice))
          totalCost <- totalCost + itemPrice
        } else {
          print("Sorry, we don't have that item.")
        }
      }
      
      break
    } else if (order == "no") {
      break
    } else {
      print("Sorry, we don't have that item.")
    }
  }
  
  print(paste("Total for your order is $", totalCost, ". Thank you!"))
}

# Calling the chatbot function
chatbot()
