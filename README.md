# Tutorial for the EULER cluster with MATLAB

## Advantages of EULER vs. a powerful workstation/server

* Professionally managed high performance computing cluster
* Computing power is much higher
* Reliability is much higher
* You are not competing with other PES people for the ressources
* Usable with MATLAB and COMSOL (and many more other softwares)
* A lot of different version of the softwares are available

## Differences between EULER vs. a powerful workstation/server

* EULER is a batching system:
    * You say: "I have a job and I want x CPUs with y GB of RAM for z hours"
    * You submit your job and it goes in a waiting queue
    * When it is your turn, your job is being processed

* EULER does not support GUI:
    * No plots in your MATLAB code
    * No GUI for COMSOL
    * If you are an advanced user, GUI is possible with X11 forwarding

## Install software

* For MS Windows users:
    * Putty: https://www.putty.org/
    * SFTP Drive v2: https://www.nsoftware.com/sftp/drive/

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

## Map you EULER drive as a network drive

* Mount the EULER filesystem as a remote drive:
    * If you are using MS Windows, use "SFTP Drive v2" software.
    * If you are using Linux, use "sshfs" command.

* Login info:
    * address: euler.ethz.ch
    * login: your NETHZ login
    * password: your NETHZ password

## MATLAB Example

1. Copy the folder "euler_code" to EULER (using the mapped network drive)
2. Get a remote console on the EULER login node (using the SSH software)
3. Go the corresponding directory: "cd euler_code"
4. Make the EULER submission script executable: "chmod +x run_main.sh"
5. Submit the job: "./run_main.sh tag"
    * Change the data in "run_main.sh" do change the job detail (CPU, RAM, time, etc.)
    * put your MATLAB code in "run_solve.m", "tag" is an string argument for MATLAB
6. Wait that the job is finished
    * check the status of the jobs: "bjobs" or "bbjobs"
    * You will get an email when the job starts, finishes, or crashes
7. Copy the results (using the mapped network drive)

## Command Description

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

## More Information

* https://scicomp.ethz.ch - EULER documentation
* https://scicomp.ethz.ch/lsf_submission_line_advisor/ - script for generating EULER commands
* https://ch.mathworks.com/help/distcomp/index.html - MATLAB parallel computing
* https://scicomp.ethz.ch/wiki/MATLAB - EULER documentation for MATLAB
* https://scicomp.ethz.ch/wiki/Comsol - EULER documentation for COMSOL
* cluster-support@id.ethz.ch - EULER support (very competent)

## Author

**Thomas Guillod** - [GitHub Profile](https://github.com/otvam)

## License

This project is licensed under the **BSD License**, see [LICENSE.md](LICENSE.md).
