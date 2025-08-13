-- Sequence return will be at least and no more than 
-- len characters long.  if length(s) < len the
-- difference will be right padded with spaces.
-- If length(s) > len then the return value will be a 
-- truncated version of s.
function fixed_len(sequence s, integer len)
    if length(s) < len then
        return s & repeat(' ', len - length(s))
    end if
    return s[1..len]
end function