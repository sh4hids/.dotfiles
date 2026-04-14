local art = [[
                            
                            
           ▒▒▒▒             
         ▒▒▒▒▒▒▒▒           
        ▒▒▒▒   ▒▒▒          
      ▒▒▒▒▒▒                
    ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒         
   ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒       
     ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒     
       ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒      
              ▒▒▒▒▒▒        
        ▒▒▒   ▒▒▒▒          
          ▒▒▒▒▒▒▒           
           ▒▒▒▒             
                            
                            

]]

local function getHeader()
  local dateStr = os.date("%A, %B %d, %Y")

  return art .. dateStr .. [[




 ]]
end

return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        header = getHeader(),
        keys = {},
      },
    },
  },
}
