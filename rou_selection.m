function [ alfa ] = rou_selection( rou1, rou2, gen, N_normal1,N_normal2, L1,L2,x1,x2,gen_set )  %select the better solution based on rou_g method
% Input: rou1,rou2: the rou value of solution x1 and x2, which can obtained by function 'rou_value'
%               gen: current evolution generation value
%              N_normal1,N_normal2: Normalization of the number of violated constraint of solution x1 and x2, which can obtained by function 'normalization_constraints_amount'
%              L1,L2: comprehensive evaluation indexes of infeasibility of solution x1 and x2, which can obtained by function 'evaluation_index'
%               x1,x2: the solutions (decision vectors)
               %   This function is based on Equation 16

alfa=0; %alfa=0 means solution x2 is better than x1; alfa=1 means x1 is better than x2
[rou_g]=calcu_rou_g(gen,gen_set);

if rou1>rou_g&&rou2>rou_g
     if N_normal1<N_normal2
         alfa=1;
     end
  elseif rou1<=rou_g&&rou2>rou_g
         alfa=1;
     elseif  rou1*rou2>0&&rou1<=rou_g&&rou2<=rou_g
         if L1<L2
             alfa=1;
         end
      elseif rou2>0&&rou2<=rou_g
          if rou1==0
              alfa=1;
          end
        elseif rou1==0&&rou2==0  %If both the twoo solutions are feasible, then the CDP method in NSGAII can be applied.
               alfa=Nondomination(x1,x2);  
end


end


function  [rou_g]=calcu_rou_g(gen,gen_set) % calculate the rou_g value based on Equation 17

a=3;
% gen_set=500;  % a and gen_set can be re-set according to the actual need 

rou_g=1-(gen/gen_set)^a;

end


function [alfa]=Nondomination(x1,x2)  
% Besides CDP, other domination principles can also be utilized to select a
% better solution. The function should be written by the users based on
% their own needs.
% 



end

