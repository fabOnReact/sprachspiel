module BuildingsHelper
   # def style
   #    case 
   #       when true then "pull-left"
   #       else "pull-right"
   #    end
   # end
   
   # # maybe the images do not need the id
   # def set_image_id
   #    case self.id 
   #       when 1 then 'grain'
   #       when 2 then 'hammer'
   #       when 4 then 'chess'
   #    end
   # end       <%= style %><%= set_image_id %> 

   def float(object)
      case object.id.odd?
         when true then 'float:right;'
         else
          'float:left;'
      end
   end

   def page(building)
      "/buildings/" + building.id.to_s
   end   
end
