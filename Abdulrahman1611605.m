  
% Abdulrahman Mohammed Salem Balfaqih
% 1611605

L1 = 559; L2 = 508; d1 = 876.3; d4 = 0; 
L(1) = Link ([0,d1,L1,0]);
L(2) = Link ([0,0,L2,pi]);
L(3) = Link ([0,0,0,0,1]);
L(4) = Link ([0,d4,0,0]);
Rob = SerialLink(L);
Rob.name = 'Abdulrahman XR1';
% q = [0,0,250,0];
% L(3).qlim = [1,1000];
% i = 0 ;


X = readmatrix("1611605_1.csv", "range" , "A2:A58");
Y = readmatrix("1611605_1.csv", "range" , "B2:B58");
Z = readmatrix("1611605_1.csv", "range" , "C2:C58");
 X_plot = readmatrix("1611605_1.csv", "range" , "A2:A58");
 Y_plot = readmatrix("1611605_1.csv", "range" , "B2:B58");
Z_plot = readmatrix("1611605_1.csv", "range" , "C2:C58");
plot3(X_plot,Y_plot,d1-Z_plot);

for i = 1:(length(X)-1)
    T =  transl(X(i), Y(i), 0);
    qs(i,:) = Rob.ikine(T,'q0',[0.2 2.0 Z(i) 0],'mask',[500,500,0,0,0,0]);
end

 for i = 1:(length(X)-1)
     T_new = qs(i,:);
     Q = fkine(Rob,T_new);
     
     X_now(i) = Q.t(1);
     Y_now(i) = Q.t(2);
     
     Rob.plot(T_new,'workspace', [ -1500   1500    -1500   1500    -1500   1500  ]);
    
   
     pause(0.25);
 end
% 
% 
% hold on
% X = 650;
% Y = 250;
% Z(1) = 250;
% for i=1:19
%     Z(i) = Z(1)+ 20*i;
% end
%  for i=1:(20-1)
%      q = [T_new(1),T_new(2),Z(i),0];
%      Rob.plot(q);
%     pause(0.025);
%  end
%  
%  Z = 650;
%  
% X_2 = readmatrix("Plot.csv", "range" , "A84:A102");
% Y_2 = readmatrix("Plot.csv", "range" , "B84:B102")
%  
% for i = 1:(length(X_2)-1)
%     T =  transl(X_2(i), Y_2(i), 0);
%     qs(i,:) = Rob.ikine(T,'q0',[T_new(1),T_new(2),650,0],'mask',[500,500,0,0,0,0]);
% end
% 
%  for i = 1:(length(X_2)-1)
%      T_new = qs(i,:);
%      Q = fkine(Rob,T_new);
%      
%      X2_now(i) = Q.t(1);
%      Y2_now(i) = Q.t(2);
%      
%      Rob.plot(T_new);
%     
%    
%      pause(0.025);
%  end
% 
% hold on
% X_2 = 250;
% Y_2 = 250;
% Z(1) = 650;
% for i=1:19
%     Z(i) = Z(1)- 20*i;
% end
%  for i=1:(20-1)
%      q = [T_new(1),T_new(2),Z(i),0];
%      Rob.plot(q);
%     pause(0.025);
%  end 

 






