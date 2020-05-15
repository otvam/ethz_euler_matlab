function run_main(n_core, tag)
%
% Main MATLAB function for EULER:
%     - init the parallel pools
%     - make the computation
%     - close the parallel pools
%
% Arguments:
%     - n_core - number of cores (or number of parallel pools)
%     - tag - string passed to the MATLAB script
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% setup
[tic, pool] = open_pool(n_core);

%% solve the problem
run_solve(tag);

%% teardown
close_pool(pool, n_core, tic);

end

function [tic, pool] = open_pool(n_core)
% init the computation, open the parallel pools
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fprintf('#######################################################\n')

% init computation
tic = datetime('now');
fprintf('start time: %s\n', datestr(tic))

% open pool
fprintf('open cluster: n_core = %d\n', n_core)
euler = parcluster('local');
pool = parpool(euler, n_core);

fprintf('#######################################################\n')

end

function close_pool(pool, n_core, tic)
% close the parallel pools, finish the computation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fprintf('#######################################################\n')

% close pool
fprintf('close cluster: n_core = %d\n', n_core)
pool.delete()

toc = datetime('now');
tic_toc = between(tic, toc);
fprintf('elapsed time: %s\n', char(tic_toc))

fprintf('#######################################################\n')

end