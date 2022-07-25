local status_ok, surround = pcall(require, "nvim-surround")
if not status_ok then
  return
end

surround.setup()

-- ## Add Surround: ys[object][char]
--
-- "ys" = "you surround"
--
-- Example:
-- ```
-- local str = "This is a sentence"
-- ```
-- If the cursor is on the T and you press ysiw', then "you surround inner word with single quotes", yielding:
--
-- ```
-- local str = "'This' is a sentence"
-- ```
--
--
-- From here, typing ysa") means "you surround around double quotes with parentheses", yielding:
--
--
-- ```
-- local str = ("'This' is a sentence")
-- ```

-- ## Delete surround
--
-- deleting surrounding pairs is done by the keymap prefix `ds`
--
-- ## Changing Surrounds
--
-- It is used via cs[char1][char2]
--
-- ```
-- local tab = { "Just", (some), "strings" }
-- ```
