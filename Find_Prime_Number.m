clear all
close all
clc
tic % Timed the code

Max_value = 10^7; % Maximal value tested


L = zeros(1, round(sqrt(Max_value))); % Preload the vectors
L(1) = 2; % Define the first prime number
L(2) = 3;
l = 2; % Index in the list
ii = max(L)+1;
f = waitbar(0,"Initialise the code")
while ii <= Max_value
b = 0;
% Check the previous prime numbers
waitbar(ii/(Max_value-4),f, [num2str(ii*100/(Max_value-4),3), '% done.'])
% f = waitbar(ii*(Max_value-3)/100,[num2str(ii*(Max_value-3)/100, 3), "% done"])
for kk = 1:size(L, 2)
    if mod(ii,L(kk)) == 0
        b = b+1;
        break
    end    
end
% Add the prime nummbers to the list
if b == 0
    L(l+1) = ii;
    l = l+1;
end
ii = ii+1;
end

% Check the results
waitbar(1,f, "Check the results")
Temp = isprime(L);
k = find(Temp == 0);
if ~isempty(k)
    warning('Results incorrect!')
else
    disp("The results are corect")
end

close(f)
clear k f
toc