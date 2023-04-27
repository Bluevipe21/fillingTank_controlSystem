# Filling tank - model made in MATLAB

The model used for this implementation in MATLAB is based in the flow through a pipe and two valves. One valve control de input flow and the other valve only close and open to increase/decrease the height of liquid inside the tank. When the two valves are working there is an accumulation of liquid inside the tank, that can be expressed as the following equation:

$Q_{in} - Q_{out} = accumulation$

But the accumulation can be expressed as the volume of liquid that is changing through time due the two valves working. The change in time is because not always the valves are open or close.

$accumulation = \frac{\Delta V}{dt}$

If we use a tank, whose cross-sectional area is constant, we can write the volume as the product between the area and the height of the tank. But in this case the height will change so the result will be:

$\Delta V = A * dh$

The output flow can be rewritten as the driving force in charge of push the output flow. This equation is:

$Q_{out} = \frac{\rho g h}{R}$

where R is the resistance from the valve used to discharge the tank. The value of the resistance can be obtained using the equation of Darcy-Weisbach. 

$\Delta P = Lf\frac{\rho}{2}\frac{v^{2}}{2}$

where $L$ is the longitude from the pipe for the output valve. $\rho$ is the density of the liquid, $v$ is the velocity of the flow, $D$ is the diameter of the pipe (connected with the valve), and $f$ is the friction factor. The friction factor can be calculated using the Colebrook-White equation or using a Moody diagram. Using the Moody diagram you only need to calculate the Reynolds number and the relative roughness that dependes of the material of the pipe.

$Reynolds number = \frac{\rho v D}{\mu}$

$roughness = \frac{\epsilon}{D}$

After doing this calculations you can check the values in the next graphic:







