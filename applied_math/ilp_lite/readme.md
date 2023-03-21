# ilpLite

<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/applied_math/ilp_lite/figures/ILP_Lite_Main.png">
</p>

Welcome to the Integer Linear Programming (ILP) Lite Toolbox! A lite-weight toolbox for Mixed-Integer Linear Programming


-----------------------------------------------------------------------------------

## Project Overview
The ILP Lite Toolbox is a software package for the design and evaluation of various integer Linear Programming (LP) methods. 
Prototyping for this project was performed in Matlab 2015b, then translated to C++ for a performant toolbox. 
This package contains several elements to aid in development and simulation, and is part of a toolset.

A Mixed-Integer Linear Program (MILP) is a problem with:
* Linear objective function, f^T \* x, where f is a column vector of constants, and x is the column vector of unknowns.
* Bounds and linear constraints, but no nonlinear constraints.
* Restrictions on some components of x to have integer values.

In mathematical terms, given vectors f, lb (integer lower-bound), and ub (integer upper-bound), matrices A and A_eq (equality constraints), corresponding vectors b and b_eq (equality constraints), and a set of integer constraint indices intCon, find a vector x to solve

min(x) f^T x,

such that x are integers

A \* x <= b,

A_eq \* x = b_eq,

lb <= x <= ub.


### Data Flow
The ILP Lite Toolbox has a simple data-flow from input to output. 
The user is simply required to supply a properly formated input file, and the type of program to run (e.g. select presolve, solve and post solve options). 
The program then runs and provides results to the CMD window and saves the results to a text or CSV file.

<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/applied_math/ilp_lite/figures/ILP_Lite_flowDiagram.png">
</p>

### Data Parse
The ILP Lite Toolbox can parse various types of input files, e.g. HEX, ASCII, CSV. After parsing the input file, the data is formatted to the input requirement of the Pre Process routines of the ILP Lite main program.

<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/applied_math/ilp_lite/figures/parser.png">
</p>

### Unit Test
The ILP Lite Toolbox includes a unit test suite, based on the [x-unit](http://xunit.github.io/) framework, to properly test each utility function. 
This ensures that known inputs provide known outputs. 
The implied goal of unit testing is to detect and alert the user of changes that 'break' the code.
If changes are made to the functions, the tests for each function should still pass. 
If not the unit test suite will flag errors which the user is then required to resolve. 
Because the unit tests are automated, the process of testing can be performed at anytime.
In a continuous integration system, e.g. [Jenkins](https://jenkins.io/), the unit tests are run each time a user commits updates to the version control system.

<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/applied_math/ilp_lite/figures/unitTest.png">
</p>

### Requirements
The ILP Lite (Matlab) Toolbox is developed and tested in MATLAB 8.6, on both 64-bit Windows 7 and Linux (Debian 8). 
Other versions of both Windows and Matlab may work but are not guaranteed. 
The following elements are needed in order to use this Toolbox:

* A computer with Windows 7 or a UNIX-based operating system (64-bit is recommended).
* A MATLAB r2015b (8.6) installation (64-bit is preferred).

The ILP Lite (C++) Toolbox is developed and tested in Microsoft Visual Studio 2010 on 64-bit Windows 7 and Eclipse Luna on 64-bit Linux Debian 8. 
Other versions of both Windows and Linux may work but are not guaranteed. 
The following elements are needed in order to use this Toolbox:

* A computer with Windows 7 or a UNIX-based operating system (64-bit is recommended).


-----------------------------------------------------------------------------------

## Operation
See `/src/matlab/README.md` or `/src/cpp/README.md` for details.


-----------------------------------------------------------------------------------

## Algorithm Overview

### Intro
ILP Lite uses a basic strategy to solve mixed-integer linear programs, and can solve the problem in any of the stages. 
If it solves the problem in a stage, ILP Lite does not execute later stages.
* Reduce the problem size using Linear Program Preprocessing.
* Solve an initial relaxed (noninteger) problem using Linear Programming.
* Perform Mixed-Integer Program Preprocessing to tighten the LP relaxation of the mixed-integer problem.
* Try Cut Generation to further tighten the LP relaxation of the mixed-integer problem.
* Try to find integer-feasible solutions using heuristics.
* Use a Branch and Bound algorithm to search systematically for the optimal solution. 
This algorithm solves LP relaxations with restricted ranges of possible values of the integer variables. 
It attempts to generate a sequence of updated bounds on the optimal objective function value.


### Linear Program Preprocessing
According to the Mixed-Integer Linear Programming definition, there are matrices A and A_eq and corresponding vectors b and b_eq that encode a set of linear inequalities and linear equalities

A \* x <=b

A_eq \* x = b_eq

These linear constraints restrict the solution x.

Usually, it is possible to reduce the number of variables in the problem (the number of components of x), and reduce the number of linear constraints. 
While performing these reductions can take time for the solver, they usually lower the overall time to solution, and can make larger problems solvable. 
The algorithms can make solution more numerically stable. 
Furthermore, these algorithms can sometimes detect an infeasible or unbounded problem.

The following steps are made, and repeated if necessary, during the Preprocessing call to `presolve`: 
* eliminate zero rows: `eliminateZeroRows`.
* eliminate zero columns: `eliminateZeroColumns`
* eliminate k-ton equality constraints (e.g. for kton = 2, eliminate doubleton and singleton constraints): `eliminateKtonEqualityConstraints`
* eliminate singleton inequality constraints: `eliminateSingletonInequalityConstraints`
* eliminate dual singleton equality constraints: `eliminateDualSingletonInequalityConstraints`.   
* eliminate implied free singleton columns: `eliminateImpliedFreeSingletonColumns`
* eliminate redundant columns: `eliminateRedundantColumns`.	
* eliminate implied bounds on rows: `eliminateImpliedBoundsonRows`.
* eliminate zero columns: `eliminateZeroColumns`.
* add slack variables (if necessary).
* make the coefficient matrix structurally full rank: `fullRank`.
* eliminate redundant rows: `eliminateRedundantRows`.

Preprocessing steps aim to eliminate redundant variables and constraints, improve the scaling of the model and sparsity of the constraint matrix, strengthen the bounds on variables, and detect the primal and dual infeasibility of the model.

For details, see Andersen and Andersen [1], Meszaros and Suhl [4], and Ploskas [8].


### Scaling
Scaling is a preconditioning technique which is necessary in some cases to improve the computational properties of a problem (see 8).  Several techniques are available and can be applied to the problem prior to finding an initial LP solution.  This toolbox includes the following options `opts.scalingMethod` in the function 'scaling':
* arithmetic mean: `arithmeticMean`.
* de buchet for the case p = 1: `deBuchet_p1`.
* de buchet for the case p = 2: `deBuchet_p2`.
* de buchet for the case p = Inf: `deBuchet_pInf`.
* entropy: `entropy`.
* equilibration: `equilibration`.
* geometric mean: `geometricMean`.
* IBM MPSX: `ibmMpsx`.
* LP-norm for the case p = 1: `lpNorm_p1`.
* LP-norm for the case p = 2: `lpNorm_p2`.
* LP-norm for the case p = Inf: `lpNorm_pInf`.


### Linear Programming
The initial relaxed problem is the linear programming problem with the same objective and constraints as Mixed-Integer Linear Programming Definition, but without integer constraints. 
Let x_LP be the solution to the relaxed problem, and x the solution to the original problem with integer constraints. 
It follows that,

f^T  \* x_LP <= f^T  \* x,

because x_LP minimizes the same function but with fewer restrictions.

This initial relaxed LP (root node LP) and all generated LP relaxations during the branch-and-bound algorithm are solved using linear programming techniques.

The function `ilp_solve` has the following LP options:
* `basicSimplex`: basic simplex algorithm. 
* `revisedSimplex`: solves the revised simplex problem using sparse matricies.
* `revisedSimplex_LU`: solves the revised simplex problem using LU factorization.
* `revisedSimplex_QR`: solves the revised simplex problem and QR factorization.  This is the recommended `lp_solve` simplex method.
* `revisedPrimalSimplex`: solves the revised primal simplex problem using sparse matricies.
* `revisedDualSimplex`: solves the revised dual simplex problem using sparse matricies.
* `primalDualInteriorPoint`: solves the Mehrotra's Predictor-Corrector infeasible primal-dual interior point using sparse matricies.
* `primalExteriorPoint`: solves the primal exterior point simplex using sparse matricies.

*Caution*: `basicSimplex`, `revisedSimplex`, `revisedSimplex_LU` and `revisedSimplex_QR` are not useful in practice, but rather for sanity checks and educational purposes.  These methods are a direct implementation of theory, without consideration for presolve, scaling, or numerical techniques which improve the computational performance of the problem to be solved.

All solvers accept both sparse and non-sparse inputs; however, to increase computational performance, non-sparse matricies will be converted internally to sparse.


### Pivoting
Successive pivoting operations are performed when solving an LP problem using a simplex method [8].  Using the `opts.pivotingRule` options, this toolbox provides the following pivoting rules (functions) to determine the entering variable:
* Bland: `bland`.
* Dantzig: `dantzig`.
* Greatest Increment Method: `gim`.
* Least Recently Considered Method: `lrcm`.
* Static partial pricing method using Dantzig's pivoting rule: `partialPricing`.
* Steepest Edge: `steepestEdge`.


### Mixed-Integer Program Pre-processing
During mixed-integer program pre-processing, `ilp_solve` analyzes the linear inequalities A \* x <= b along with integrality restrictions to determine whether:
* The problem is infeasible. 
* Some bounds can be tightened. 
* Some inequalities are redundant, so can be ignored or removed. 
* Some inequalities can be strengthened. 
* Some integer variables can be fixed. 

The goal of mixed-integer program pre-processing is to simplify ensuing branch-and-bound calculations. 
Pre-processing involves quickly pre-examining and eliminating some of the futile subproblem candidates that branch-and-bound would otherwise analyze.

For details about integer pre-processing, see Savelsbergh [6].


### Cut Generation
Cuts are additional linear inequality constraints that the `cuttingPlane` function adds to the problem. 
These inequalities attempt to restrict the feasible region of the LP relaxations so that their solution are closer to integers. 
The user must define the type of cuts that `ilp_solve` and `cuttingPlane` use with the `opts.cutMethod` option.
* `mir`: Mixed-integer rounding cuts.
* `gomory`: Gomory cuts.
* `cliques`: Clique cuts.
* `cover`: Knapsack cover cuts.
* `flowCover`: Flow cover cuts.
* `liftProj`: Lift-and-project cuts.
* `pivotReduce`: Pivot-and-reduce cuts.
* `reduceSplit`: Reduce-and-split cuts.
* `chvatalGomory`: Chvatal-Gomory cuts.
* `zeroHalf`: Zero-half cuts.

Another option, `maxCuts`, specifies an upper bound on the number of times `ilp_solve` iterates to generate cuts.

For details about cut generation algorithms (also called cutting plane methods), see Cornuejols [2].


### Heuristics for Finding Feasible Solutions
To get an upper bound on the objective function, the branch-and-bound procedure must find feasible points. 
A solution to an LP relaxation during branch-and-bound can be integer feasible, which can provide an improved upper bound to the original MILP. 
There are techniques for finding feasible points faster before and/or during branch-and-bound. 
These techniques are heuristic, meaning they are algorithms that can succeed, but can also fail. 
The user must define the `ilp_solve` heuristics in `opts.heuristics`. 
The options are:
* `rins`: `ilp_solve` searches the neighborhood of the current best integer feasible solution point (if available) to find a new and better solution. 
See Danna, Rothberg, and Le Pape [3].
* `rss`: `ilp_solve` applies a hybrid procedure combining ideas from `rins` and local branching to search for integer feasible solutions.
* `round`: `ilp_solve` takes the LP solution to the relaxed problem at a node. 
It rounds the integer components in a way that attempts to maintain feasibility.
* `none`: `ilp_solve` does not search for a feasible point. 
It simply takes any feasible point it encounters in its branch-and-bound search.


### Branch and Bound
The branch-and-bound method, in the `branchAndBound` function, constructs a sequence of subproblems that attempt to converge to a solution of the MILP. 
The subproblems give a sequence of upper and lower bounds on the solution f^T \* x. 
The first upper bound is any feasible solution, and the first lower bound is the solution to the relaxed problem. 
For a discussion of the upper bound, see Heuristics for Finding Feasible Solutions.

As explained in Linear Programming, any solution to the linear programming relaxed problem has a lower objective function value than the solution to the MILP. 
Also, any feasible point x_feas satisfies

f^T \* x_feas <= f^T \* x,

because f^T \* x is the minimum among all feasible points.

In this context, a node is an LP with the same objective function, bounds, and linear constraints as the original problem, but without integer constraints, and with particular changes to the linear constraints or bounds. 
The root node is the original problem with no integer constraints and no changes to the linear constraints or bounds, meaning the root node is the initial relaxed LP.

From the starting bounds, the branch-and-bound method constructs new subproblems by branching from the root node. 
The branching step is taken heuristically, according to one of several rules. 
Each rule is based on the idea of splitting a problem by restricting one variable to be less than or equal to an integer J, or greater than or equal to J+1. 
These two subproblems arise when an entry in x_LP, corresponding to an integer specified in `data.intCon`, is not an integer. 
Here, x_LP is the solution to a relaxed problem. 
Take J as the floor of the variable (rounded down), and J+1 as the ceiling (rounded up). 
The resulting two problems have solutions that are larger than or equal to f^T \* x_LP, because they have more restrictions. 
Therefore, this procedure potentially raises the lower bound.

The performance of the branch-and-bound method depends on the rule for choosing which variable to split (the branching rule). 
The algorithm uses these rules, which you can set in the `opts.branchRule` option:

* `maxCost` Choose the fractional variable with maximal pseudocost.
* `minCost` Choose the fractional variable with minimal pseudocost.
* `mostFractional` Choose the variable with fractional part closest to 1/2.
* `leastFractional` Choose the variable with fractional part furthest from 1/2.
* `maxFun` Choose the variable with maximal corresponding absolute value in the objective vector f.

After the algorithm branches, there are two new nodes to explore. 
Using `opts.branchMethod` the algorithm chooses which node to explore among all that are available using one of these rules:

* `depthFirst` Chose the node that results in fast 'diving'.
* `breadthFirst` Chose the node that results in shallow 'diving'.
* `minCost` Chose the node that has the lowest objective function value.
* `maxCost` Chose the node that has the highest objective function value.
* `minObj` Choose the node that has the lowest objective function value.
* `minInfeas` Choose the node with the minimal sum of integer infeasibilities. 
This means for every integer-infeasible component x(i) in the node, add up the smaller of *p_i_minus* and *p_i_plus*, where
  * p(i)_minus = x(i) - (x(i))_lb
  * p(i)_plus = 1 - p(i)_minus.
* `simpleBestProj` Choose the node with the best projection.

Best Projection The branch-and-bound procedure continues, systematically generating subproblems to analyze and discarding the ones that won't improve an upper or lower bound on the objective, until one of these stopping criteria is met:

* The algorithm exceeds the `opts.maxTime` option.
* The difference between the lower and upper bounds on the objective function is less than the `opts.tolGapAbs` or `opts.tolGapRel` tolerances.
* The number of explored nodes exceeds the `opts.maxNodes` option.
* The number of integer feasible points exceeds the `opts.maxNumFeasPts` option.

For details about the branch-and-bound procedure, see Nemhauser and Wolsey [5] and Wolsey [7].


### Branch and Cut
The branch-and-Cut function (`branchAndCut`) combines the functions and selected options for both `branchAndBound` and `cuttingPlane` functions, ideally solving ILP problems faster and more efficiently. 


## Versioning
We use [TortiseSVN](https://tortoisesvn.net/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags).


## Authors
* Dr. P. Roysdon - Lead and *Initial work*
* Dr. M. Kelly - Peer-reviewer
* Dr. R. Bryant - Peer-reviewer


## License
This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.

<!---
## Acknowledgments
* The OR Community
* The NM folks
--->

## References
This toolbox uses several references, most of which are listed in the files themselves. However, the primary references are:
1. Andersen, E. D., and Andersen, K. D. "Presolving in linear programming," Mathematical Programming 71, pp. 221-245, 1995.
2. Cornuejols, G. "Valid inequalities for mixed integer linear programs," Mathematical Programming B, Vol. 112, pp. 3-44, 2008.
3. Danna, E., Rothberg, E., Le Pape, C. "Exploring relaxation induced neighborhoods to improve MIP solutions," Mathematical Programming, Vol. 102, issue 1, pp. 71-90, 2005.
4. Meszaros C., and Suhl, U. H. "Advanced preprocessing techniques for linear and quadratic programming," OR Spectrum, 25(4), pp. 575-595, 2003.
5. Nemhauser, G. L. and Wolsey, L. A. "Integer and Combinatorial Optimization," Wiley-Interscience, New York, 1999.
6. Savelsbergh, M. W. P. "Preprocessing and Probing Techniques for Mixed Integer Programming Problems," ORSA J. Computing, Vol. 6, No. 4, pp. 445-454, 1994.
7. Wolsey, L. A. "Integer Programming," Wiley-Interscience, New York, 1998.
8. Ploskas, N., & Samaras, N. "Linear Programming Using Matlab," Springer, 2017.



-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------

[//]: # "Do single-line comments like this"

<!---
"Do multi-line comments like this"
--->
