function run_solve(tag)
%
% Solve a computation:
%     - make the computation
%     - save the results
%
% The code should use (if possible) parfor loops (or any other parallel features).
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% init
fprintf('start solve: %s\n', tag)

% size of the dummy problem
n_loop = 50;
n_mat = 500;

% compute many eigenvalues
parfor i=1:n_loop
    fprintf('    %d / %d\n', i, n_loop)
    A = rand(n_mat, n_mat);
    data(:,i) = eig(A);
end

% save the results
fprintf('    save\n')
save([tag '.mat'], '-v7.3', 'data', 'n_loop', 'n_mat')

% teardown
fprintf('end solve: %s\n', tag)

end