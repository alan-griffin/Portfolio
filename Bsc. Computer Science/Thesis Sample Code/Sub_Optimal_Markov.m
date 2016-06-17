% Proportional gambling is no longer log-optimal due to track take
% With Subfair Odds
fileID = fopen('First_Race.txt','r');
formatSpec = '%f';
A = fscanf(fileID,formatSpec);
m = length(A) / 9;
fclose(fileID);
B = reshape(A,m,9);

% Reset Probabilities
len = size(B,1);
for j = 1 : 9
   prob = 1;
   for i = 3 : len 
       n = B(i,j);
       prob = prob * 1/n;
   end
   B(1,j) = prob; 
end  


% Re-adjust probability
prob = 0;
for j = 1 : 9
   prob = prob + B(1,j);
end  
for j = 1 : 9
   B(1,j) = B(1,j) / prob;
end

% Calculate Fraction
new_bets = zeros(1,9);
for j = 1 : 9
   new_bets(j) = ( 1 - B(1,j) ) / ( 1 - ( 1 / B(2,j)));
end

new_bets = sort(new_bets);

for j = 1 : 9
   if new_bets(j) > 0 && new_bets(j) < 1
       min_pos = new_bets(j);
       break;
   end
end 

% Calculate Bets
starting_payroll = 1000;
bets = zeros(1, 9);
money_down = zeros(1, 9);
for j = 1 : 9
    bets(j) = B(1,j) - min_pos / B(2,j);
    if bets(j) < 0
        bets(j) = 0;
    end    
end

% Betting Simulation
cash = zeros(0, 10000);
token = 1;
for a = 1 : 10000
    
new_payroll = starting_payroll;
betting_payroll = starting_payroll;
% Make bet as long as there is no negative edge
i = 1;
for j = 1 : 9
    if bets(j) > 0 && token == j
        money_down(i) = betting_payroll * bets(j);
        new_payroll = new_payroll - money_down(i);
    else money_down(i) = 0;    
    end
    i = i + 1;
end

% Race Simulation + Payout
i = sum(rand >= cumsum(B(1,1:len)));
new_payroll = new_payroll + ( money_down(i+1) * B(2,i+1) );
token = i;

starting_payroll = new_payroll;
cash(a) = new_payroll;

% Check for Gamblers Ruin
if new_payroll < 1     
    helpdlg('The house has won! Your bankroll is now empty','Gamblers Ruin');
    return;
end

end

% Betting Simulation
starting_payroll = 1000;
cash_2 = zeros(0, 10000);
token = 1;
for a = 1 : 10000
    
new_payroll = starting_payroll;
betting_payroll = starting_payroll;
% Make bet as long as there is no negative edge
i = 1;
for j = 1 : 9
    if bets(j) > 0 && ( token == j || B(1,j) > .2 )
        money_down(i) = betting_payroll * bets(j);
        new_payroll = new_payroll - money_down(i);
    else money_down(i) = 0;    
    end
    i = i + 1;
end

% Race Simulation + Payout
i = sum(rand >= cumsum(B(1,1:len)));
new_payroll = new_payroll + ( money_down(i+1) * B(2,i+1) );
token = i;

starting_payroll = new_payroll;
cash_2(a) = new_payroll;

% Check for Gamblers Ruin
if new_payroll < 1     
    helpdlg('The house has won! Your bankroll is now empty','Gamblers Ruin');
    return;
end

end

% Betting Simulation
starting_payroll = 1000;
cash_3 = zeros(0, 10000);
token = 1;
for a = 1 : 10000
    
new_payroll = starting_payroll;
betting_payroll = starting_payroll;
% Make bet as long as there is no negative edge
i = 1;
for j = 1 : 9
    if bets(j) > 0 && ( token == j || B(1,j) > .5 )
        money_down(i) = betting_payroll * bets(j);
        new_payroll = new_payroll - money_down(i);
    else money_down(i) = 0;    
    end
    i = i + 1;
end

% Race Simulation + Payout
i = sum(rand >= cumsum(B(1,1:len)));
new_payroll = new_payroll + ( money_down(i+1) * B(2,i+1) );
token = i;

starting_payroll = new_payroll;
cash_3(a) = new_payroll;

% Check for Gamblers Ruin
if new_payroll < 1     
    helpdlg('The house has won! Your bankroll is now empty','Gamblers Ruin');
    return;
end

end

x = 1:10000;
g1 = loglog(x, log(cash(x)), x, log(cash_2(x)), x, log(cash_3(x)), 'LineWidth',2);
ylabel('Log(Wealth)')
xlabel('Races Run')
legend('Full Kelly with Winning State', 'Full Kelly with Winning State | p(x) > 20%',...
    'Full Kelly with Winning State | p(x) > 50%', 'Location', 'southeast' );