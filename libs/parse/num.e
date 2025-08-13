-- Returns 1 if the string is a valid, undecorated base-10 number (e.g., "42", "-3.14", ".5")
-- Returns 0 otherwise.
-- 
-- Notes:
-- - No commas, exponents, or hex/octal prefixes allowed.
-- - Leading + or - is allowed.
-- - A leading or trailing decimal point is valid (e.g., ".5", "5.").
-- - Empty strings, multiple dots, or non-digit characters cause failure.
function is_number(sequence maybe)
    integer found_dot = 0
    integer i = 1
    integer c = 0
    integer retval = 0
    
    -- because empty string is not a number
    if length(maybe) = 0 then
        return 0
    end if
    
    -- we'll skip the sign if it has one
    if find(maybe[i], "+-") then
        i += 1
    end if
    
    -- We might have just moved the index.  Make sure there is at 
    -- least 1 more character to consider.
    if i > length(maybe) then
        return 0
    end if
    
    -- if nothing follows a leading . maybe isn't a number
    if equal(maybe[i], '.') and (i + 1 > length(maybe)) then
        return 0
    end if
    
    -- At this point i is either 1 or 2.  It's 1 if there is no sign. It's
    -- 2 if there is a sign.  maybe[i] might be a . but it might not be.
    -- If it is a dot at least one more char is required in a valid string.  
    -- Let's say we have this string.  "+.." .  In that
    -- case i is 2 when we enter the loop.  We'll set retval to 1 and 
    -- consume the first . .  The first . is valid. Let's start consuming 
    -- the rest of the string.  Anything other than a digit is invalid.  
    --
    -- I believe this loop should be able to accurately determine whether or
    -- not a string is a base-10 undecorated number.  Edge cases are already 
    -- dealt with. Looks good on my monitor.
    while i < (length(maybe) + 1) do
        c = maybe[i]
        if equal(c, '.') and found_dot then
            return 0
        end if

        if equal(c, '.') then 
            found_dot = 1
        elsif not find(c, "0123456789") then
            return 0
        end if
        retval = 1
        i+=1
    end while
    return retval
end function