function L = decoder(f)
% find frequency values that are whole number integers of f
    if f == 1
        L = 'a';
    elseif f == 2
        L = 'b';
    elseif f == 3
        L = 'c';
    elseif f == 4
        L = 'd';
    elseif f == 5
        L = 'e';
    elseif f == 6
        L = 'f';
    elseif f == 7
        L = 'g';
    elseif f == 8
        L = 'h';
    elseif f == 9
        L = 'i';   
    elseif f == 10
        L = 'j';  
    elseif f == 11
        L = 'k';
    elseif f == 12
        L = 'l';
    elseif f == 13
        L = 'm';
    elseif f == 14
        L = 'n';
    elseif f == 15
        L = 'o';
    elseif f == 16
        L = 'p';
    elseif f == 17
        L = 'q'; 
    elseif f == 18
        L = 'r';
    elseif f == 19
        L = 's';
    elseif f == 20
        L = 't'; 
    elseif f == 21
        L = 'u';
    elseif f == 22
        L = 'v';
    elseif f == 23
        L = 'w';
    elseif f == 24
        L = 'x';
    elseif f == 25
        L = 'y';
    elseif f == 26
        L = 'z';
    elseif f == 27
        L = '.';
    elseif f == 28
        L = ',';
    elseif (f == 29 | f == 0)
        L = ' ';
    end