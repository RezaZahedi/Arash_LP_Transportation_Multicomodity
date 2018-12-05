function z = CostFun(Upper, D1, D2, f)

penalty = 20000;
z = f(1:length(D2))*Upper(:,:)';
z = z + f(length(D2)+1:length(f)) * (D1-D2*Upper(:,:)');

z = z + (sum(((D1-D2*Upper(:,:)')<0)*penalty));
% 
% for i = 1:length(D2)
%     z = z + f(i).*Upper(:, i); %vectorizing the cost functions
% end
% 
% for i = 1:length(D1)
%     z = z + f(length(D2)+i).*(D1(i)-D2(i).*Upper(:, i)); %vectorizing the cost functions
% end
end