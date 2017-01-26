function [v, pi, Cum_Rwd] = policyIteration2(model, maxit)

% initialize the value function
v = zeros(model.stateCount, 1);
pi = ones(model.stateCount, 1);
% old_v = zeros(model.stateCount, 1);
policy = ones(model.stateCount, 1);
tol = 0.0000000000000000000001;

Cum_Rwd = zeros(maxit, 1);
 
for iterations = 1:maxit,
     
    for i = 1:maxit,
        v_ = zeros(model.stateCount, 1);
        % perform the Bellman update for each state
        
        for s = 1:model.stateCount
            v_(s) = model.R(s, policy(s)) + (model.gamma * model.P(s, :, policy(s)) * v)';
            Reward = model.R(s,policy(s));
            Cum_Rwd(iterations) = Cum_Rwd(iterations) + model.gamma * Reward;
        end       
        

    delta = norm(v - v_);
    v = v_;
    %check for convergence
    if delta <= tol
        fprintf('Value function converged after %d iterations\n',i);
        break;
    end     
      
    end    
  
    for s = 1:model.stateCount    
        P = reshape(model.P(s,:,:), model.stateCount, 4);    
        [~, action] = max ( model.R(s,:) + (model.gamma  * P' * v)' );
        policy(s) = action;
        
%         Reward = model.R(s,policy(s));
%         
%         Cum_Rwd(iterations) = Cum_Rwd(iterations) + model.gamma * Reward;
    end
        
end

pi = policy;
v = v_;

end



