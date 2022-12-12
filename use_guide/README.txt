In order to run SWIFT, your directory should contain: 

* All EoS table files
* initial condition hdf5 file
* parameter file
* swift/swift_mpi executable.

Parameter file and IC file.

EOS:           ANEOS_forsterite_S19
               ANEOS_iron_S20

please download the EoS file using bellowing command:

EoS source:    wget http://virgodb.cosma.dur.ac.uk/swift-webstorage/EoS/ANEOS_forsterite_S19.txt
               wget http://virgodb.cosma.dur.ac.uk/swift-webstorage/EoS/ANEOS_iron_S20.txt

IC file:  snapshot_swift_impact_05715_0468_5e4_9d7_055_100box.hdf5
          target planetsimal : around 0.5715 M_earth with 5e4 gas particles
          impact planetsimal : around 0.468  M_earth with 5e4 gas particles
          impact velocity    : 9.7 km/s
          impact paraneter   : 0.55
          boxsize            : 100 R_earth
          
SLURM scrpts: 
    single_node_script.sh 
    multi_node_script.sh
        
    I tend to submit script directly in the scractch space, so the scripts don't contain any command 
    that should be used if submmited from the home directory.
