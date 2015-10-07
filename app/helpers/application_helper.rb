module ApplicationHelper
     def sortable(column, title = nil)
    title ||= column.titleize 
    #titleize is like capitalize(capitalization) but for Titles.. hence title..ize...
    # ||= means if title is false or undefined or nil[which it is], set it equal to column
    #note that title in database may be different than title on page
    
    direction = (column == params[:sort] && params[:direction] == "asc") ? "desc" : "asc"
    #does/IF column match currently selected sort column?
      #AND if Direction is Ascending, then CHANGE it to Descending, otherwise change to ascending
        # ? evaluates if something is true or false, and if its true THEN it does the first thing, if false it does second
    #EVERYTHING in this line is determining the direction based on the user's click and the previous state
      
    link_to title, :sort => column, :direction => direction
    #link_to looks for text to display, then what/where you want it to do/go
    #we are using a symbol/variable in place of literal inline text [i.e. sort and direction]
      #the reason we are using a symbol, is because we don't know what is clicked, until it is clicked
    #note that we are doing 2 in 1 line.
  end
end
