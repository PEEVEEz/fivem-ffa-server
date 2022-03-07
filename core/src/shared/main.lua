Shared = {}
Shared.Function = {}

Shared.Function.Split = function(pString, pPattern)
   local returnTable = {}
   if not pPattern then return end

   for string in string.gmatch(pString, "([^"..pPattern.."]+)") do
      table.insert(returnTable, string)
   end

   return returnTable
end