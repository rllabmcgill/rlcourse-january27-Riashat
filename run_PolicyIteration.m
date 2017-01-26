%policy iteration2 is the correct implementation

% CORRECT
smallworld;
[v, pi, Cum_Rwd] = policyIteration2(model, 1000)
plotVP(v,pi, paramSet)
title('Policy Iteration on Small World MDP, 1000 Iterations','fontweight','bold','fontsize',12);


% CORRECT
gridworld;
[v, pi, Cum_Rwd] = policyIteration2(model, 1000)
plotVP(v,pi, paramSet)
title('Policy Iteration on Grid World MDP, 1000 Iterations','fontweight','bold','fontsize',12);

% CORRECT
cliffworld;
[v, pi, Cum_Rwd] = policyIteration2(model, 1000)
plotVP(v,pi, paramSet)
title('Policy Iteration on Cliff World MDP, 1000 Iterations','fontweight','bold','fontsize',12);





smallworld;
[v, pi] = policyIteration(model, 1000)

plotVP(v,pi, paramSet)

gridworld;
[v, pi] = policyIteration(model, 1000)

plotVP(v,pi, paramSet)
