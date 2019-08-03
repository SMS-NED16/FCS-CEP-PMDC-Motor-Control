# FCS-CEP-PMDC-Motor-Control
## Simulink-based modelling, PID controller design, and speed control of a Permanent Magnet DC (PMDC) Motor using physical RPM step response data.

Completed as an end-of-semester Complex Engineering Problem (CEP) for EE-374 Feedback Control Systems, a 3rd year course taught as part of BE-Electrical Engineering at NEDUET.

Please see the [report](./fcs-cep-report-draft-05.pdf){:target="_blank"} for more details.

## Group
TE-EE 16-17 Section D, Spring 2019

| Roll Number | Name          | Roles |
|-------------|---------------|-------|
| EE-16163    | Saad Siddiqui | MATLAB visualizations, Root Loci, Bode Plot Analysis, Stability Assessment, Research, Report |
| EE-16164    | Faiq Siddiqui | Arduino Prototyping, Simulink Modeling, Parameter Estimation, PID Tuning, Report |
| EE-16194    | Syed Abdul Haseeb Qadri | Arduino Prototyping, Research, Report |
| EE-16165    | Syed Daniyal Ali Shah | Routh Criteria, Root Loci, Research, Report |
| EE-16084    | Aymen Batool | Theory, Literature Review, Research, Report |

## Deliverables
- Derived the transfer function for a generic PMDC motor as a feedback control system in terms of its ielectromechanical parameters:
  - `J` - The moment of inertia of the motor's shaft
  - `K_t` - Motor Torque Constant
  - `K_v` - Motor Velocity Constant
  - `R_a` - Armature circuit resistance
  - `L_a` - Armature circuit inductance
- Used a slotted disc, an Arduino Uno, an LM393 IR RPM sensor, and sketch `measure_RPM.c` to record an [actual PMDC motor](http://www.electronicaestudio.com/docs/SHT-034.pdf)'s response to a step voltage in terms of its RPM, with and without gears coupled to its shaft. 
- Used step response RPM data with a Simulink Model `pmdc_model.slx` and Simulink's parameter estimation toolbox to iteratively obtain approximations for its electromechanical constants for both gear and gearless variants.
- Performed stability assessment for both variants using
  - Routh-Hurwitz Criteria
  - Bode plots
  - Root Loci
- Implemented a simple, armature resistance-based speed controller with a potentiometer and op-amp.
- Used Simulinks PID tuning functionality to derive optimal values of PID controller coefficients for both systems. 
- Compared and contrasted motor response with and without gears. 
