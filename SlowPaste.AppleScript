on run {input, parameters}
  set clip_text to (the clipboard as text)
  set clip_paragraphs to paragraphs of clip_text
  if (count of clip_paragraphs) > 0 then
    set line_text to item 1 of clip_paragraphs
    
    repeat with n from 1 to count of line_text
      
      set next_char to character n of line_text
      tell application "Terminal"
        activate
        tell window 1
          tell application "System Events" to keystroke next_char
        end tell
      end tell
      delay 0.02 + (random number 0.05)
      
    end repeat
    tell application "Terminal"
      activate
      tell window 1
        tell application "System Events" to keystroke return
      end tell
    end tell
    
    set num_lines to count of clip_paragraphs
    if num_lines > 1 then
      set remaining_lines to items 2 thru num_lines of clip_paragraphs
      set tid to AppleScript's text item delimiters
      set AppleScript's text item delimiters to return
      set output to remaining_lines as Unicode text
      set AppleScript's text item delimiters to tid
      set the clipboard to output
    else
      set the clipboard to ""
    end if
    
  end if
  return input
end run
