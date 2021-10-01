% This code check all the number below "Max_value" to find the prime numbers and list them in "L".
% Author      :   Clement Brousse
%                 clbrous@okstate.edu
% Last update :   October 1st 2021

% Clear the workspace
clear all
close all
clc

Max_value = 10^7; % Maximal value tested. Should be greater than 3.

tic % Timed the code

L = zeros(1, round(sqrt(Max_value))); % Preload the vectors
L(1) = 2; % Define the two first prime number
L(2) = 3;
l = 2; % Index in the list
ii = max(L)+1;
f = waitbar(0,"Initialise the code"); % Initialize the progress bar
while ii <= Max_value
b = 0;
% Check the previous prime numbers
waitbar(ii/(Max_value-4),f, [num2str(ii*100/(Max_value-4),3), '% done.']); % Update the progress bar
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

% Check if the results are prime number
waitbar(1,f, "Check the results"); % Update the progress bar
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