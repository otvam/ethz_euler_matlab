# Tutorial for the ETHZ EULER Cluster with MATLAB

![license - BSD](https://img.shields.io/badge/license-BSD-green)
![language - bash](https://img.shields.io/badge/language-bash-blue)
![category - science](https://img.shields.io/badge/category-science-lightgrey)
![status - unmaintained](https://img.shields.io/badge/status-unmaintained-red)

## Advantages of EULER vs. a powerful workstation/server

* Professionally managed **high performance computing cluster**
* **Computing power** is much higher
* **Batching system** for managing the jobs
* **Reliability** is much higher
* You are not competing with other people for the ressources
* Usable with Python, MPI, MATLAB, COMSOL, Maxwell (and many more other softwares)
* A lot of different versions of the softwares are available

## Differences between EULER vs. a powerful workstation/server

* EULER is a batching system
    * You say: "I have a job and I want x CPU cores with y GB of RAM for z hours"
    * You submit your job and it goes in a waiting queue
    * When it is your turn, your job is being processed
* EULER limitations
    * Euler is not meant for interactive softwares
    * Euler is not meant for GUIs (however X11 forwarding is possible)
    * Plots should be rendered directly to files

## Install software

* For MS Windows users:
    * Putty: https://www.putty.org/
	* WinSCP: https://winscp.net/eng/
* For Linux users:
    * Install "ssh" (install the package)
    * Install "sshfs" (install the package)

## SSH console to the login node

* Remote access to the cluster (to start the job, get the results, etc.):
    * If you are using MS Windows, use "putty" software.
    * If you are using Linux, use "ssh" command.
* Login info:
    * address: euler.ethz.ch
    * login: your NETHZ login
    * password: your NETHZ password
* If you are an advanced user, you can replace add SSH keys for the login
* You need to be inside the ETH network to connect (or use the VPN)

## Map you EULER drive as a network drive

* Mount the EULER filesystem as a remote drive:
    * If you are using MS Windows, use "SFTP Drive v2" or "WinSCP" software.
    * If you are using Linux, use "sshfs" command.
* Login info:
    * address: euler.ethz.ch
    * login: your NETHZ login
    * password: your NETHZ password
* You need to be inside the ETH network to connect (or use the VPN)

## MATLAB parallel code example

* **run_main.sh** - Bash script for submitting the job to EULER
* **run_main.m** - Main MATLAB function (start parallel pool, run the code, close parallel pool)
* **run_solve.m** - MATLAB function containg the problem to be solved

1. Copy the folder "euler_matlab_example" to EULER (using the mapped network drive)
2. Get a remote console on the EULER login node (using the SSH software)
3. Go the corresponding directory: "cd euler_matlab_example"
4. Make the EULER submission script executable: "chmod +x run_main.sh"
5. Submit the job: "./run_main.sh tag"
    * Change the data in "run_main.sh" do change the job detail (CPU, RAM, time, etc.)
    * Put your MATLAB code in "run_solve.m"
	* The string argument ("tag") defines the job name
	* The string argument ("tag") is passed to the MATLAB script
6. Wait that the job is finished
    * Check the status of the jobs: "bjobs" or "bbjobs"
    * You will get an email when the job starts, finishes, or crashes
7. Copy the results (using the mapped network drive)

## Useful commands

```
bsub        submit a job
module      load modules (MATLAB, COMSOL, etc.)
busers      user limits, number of pending and running jobs
bqueues     queues status (open/closed; active/inactive)
bjobs       more or less detailed information about pending, running and recently finished jobs
bbjobs      better bjobs (bjobs with human readable output)
bhist       information about jobs that finished in the last hours/days
bpeek       display the standard output of a given job
lsf_load    show the CPU load of all nodes used by a job
bkill       kill a job
```

## Going further

* https://scicomp.ethz.ch - EULER documentation
* https://scicomp.ethz.ch/lsf_submission_line_advisor/ - script for generating EULER commands
* https://ch.mathworks.com/help/distcomp/index.html - MATLAB parallel computing
* https://scicomp.ethz.ch/wiki/MATLAB - EULER documentation for MATLAB
* https://scicomp.ethz.ch/wiki/Comsol - EULER documentation for COMSOL
* https://scicomp.ethz.ch/wiki/Euler_applications - EULER installed software
* cluster-support@id.ethz.ch - EULER support (very competent)

## Author

**Thomas Guillod** - [GitHub Profile](https://github.com/otvam)

## License

This project is licensed under the **BSD License**, see [LICENSE.md](LICENSE.md).
