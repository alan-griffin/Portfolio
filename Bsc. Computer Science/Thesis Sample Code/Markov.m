% Race Modelled as First-Order Markov Chain

fileID = fopen('Third_Race.txt','r');
formatSpec = '%f';
A = fscanf(fileID,formatSpec);
num = length(A)/8;
m = length(A) / num;
fclose(fileID);
B = reshape(A,m,num);
starting_payroll = 1000;
starting_payroll_2 = 1000;

% Reset Probabilities
for j = 1 : num
   prob = 1;
   for i = 3 : 8
       n = B(i,j);
       prob = prob * 1/n;
   end
   B(1,j) = prob; 
end  

% Re-adjust probability
prob = 0;
for j = 1 : num
   prob = prob + B(1,j);
end  
for j = 1 : num
   B(1,j) = B(1,j) / prob;
end

% Calculate Fraction
new_bets = zeros(1,num);
for j = 1 : num
   new_bets(j) = ( 1 - B(1,j) ) / ( 1 - ( 1 / B(2,j)));
end

new_bets = sort(new_bets);

for j = 1 : num
   if new_bets(j) > 0 && new_bets(j) < 1
       min_pos = new_bets(j);
       break;
   end
end

% Calculate Bets
bets = zeros(1, num);
money_down = zeros(1, num);
money_down_2 = zeros(1, num);
for j = 1 : num
    bets(j) = B(1,j) - min_pos / B(2,j);
    if bets(j) < 0
        bets(j) = 0;
    end    
end

cash = zeros(1, 10000);
cash_2 = zeros(1, 10000);

for a = 1 : 10000
    
new_payroll = starting_payroll;
betting_payroll = starting_payroll;

new_payroll_2 = starting_payroll_2;
betting_payroll_2 = starting_payroll_2;

% Make bet as long as there is no negative edge
r = 1;
for j = 1 : num
    if bets(j) > 0
        money_down(r) = betting_payroll * bets(j);
        new_payroll = new_payroll - money_down(r);
    else money_down(r) = 0;    
    end
    r = i + 1;
end

r = 1;
for j = 1 : num
    if bets(j) > 0
        money_down_2(r) = betting_payroll_2 * bets(j) / 4;
        new_payroll_2 = new_payroll_2 - money_down_2(r);
    else money_down_2(r) = 0;    
    end
    r = i + 1;
end

% Race Simulation + Payout
C = B(1,1:num);
D = zeros(1,num);
for k = 1 : (num - 1)
    
    i = sum(rand >= cumsum(C(1,1:num)));
    if k == 1
        new_payroll = new_payroll + ( money_down(i+1) * B(2,i+1) );
        new_payroll_2 = new_payroll_2 + ( money_down_2(i+1) * B(2,i+1) );
    end    
    D(1,i+1) = k;
    C(1,i+1) = 0; 
    
    % Re-adjust probability
    prob = 0;
    for j = 1 : num
       prob = prob + C(1,j);
    end  
    for j = 1 : num
       C(1,j) = C(1,j) / prob;
    end
    
end

for j = 1 : num
    if C(1,j) == 1
        D(1,j) = num;
    end
end

% Multiply by weights
for j = 1 : num
    if B(1,j) > 0.01
    B(1,j) = B(1,j) * (1 / D(1,j));
    % Alternative Weights
%     B(1,j) = B(1,j) * (1 / (1 + (D(1,j) / 10)));
    end
end    
% Re-adjust probability
prob = 0;
for j = 1 : num
   prob = prob + B(1,j);
end  
for j = 1 : num
   B(1,j) = B(1,j) / prob;
end

% Reset Betting
% Calculate Fraction
new_bets = zeros(1,num);
for j = 1 : num
   new_bets(j) = ( 1 - B(1,j) ) / ( 1 - ( 1 / B(2,j)));
end

new_bets = sort(new_bets);

for j = 1 : num
   if new_bets(j) > 0 && new_bets(j) < 1
       min_pos = new_bets(j);
       break;
   end
end

% Calculate Bets
bets = zeros(1, num);
money_down = zeros(1, num);
for j = 1 : num
    bets(j) = B(1,j) - min_pos / B(2,j);
    if bets(j) < 0
        bets(j) = 0;
    end    
end

starting_payroll = new_payroll;
starting_payroll_2 = new_payroll_2;
cash(a) = new_payroll;
cash_2(a) = new_payroll_2;

% Check for Gamblers Ruin
% if new_payroll_2 < 1     
%     X = ['RUIN on ', num2str(a), 'th Gamble'];
%     disp(X);
%     return;
% end

end

x = 1 : 10000;
figure;
loglog(x, log(cash(x)), 'r', x, log(cash_2(x)), ':', 'LineWidth', 2);
ylabel('Log(Wealth)')
xlabel('Races Run')
legend('Full Kelly', 'Quarter Kelly', 'Location', 'northwest' );
title('Six race results as SI');