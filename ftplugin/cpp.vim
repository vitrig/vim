"This disables auto indent for labels
"It is annoying to have automatic indent for labels
"in C++, because when you type 'std:' it is considered
"by vim as a label and is autoindented. Then if you type
"second ':', it is not considered a label anymore and
"you get the following effect
"1|       std_    <-- you want to type std::
"2|std:_          <-- it is treated as a label 
"3|       std::_  <-- you get the annoting flickering effect
set cino+=L0
