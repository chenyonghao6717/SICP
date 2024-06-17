; as mentioned in 2.14.scm, the uncertainty part will also influence the result if operate an interval over itself,
; because the current implement cannot know the variables it is operating are identical or not.
; so it's better to avoid involving same variables multiple times in a procedure based on the current implement.