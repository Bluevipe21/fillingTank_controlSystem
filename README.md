# Filling tank - model made in MATLAB

The MATLAB implementation used in this study is based on a model of fluid flow through a pipe and two valves. One valve controls the input flow, while the other valve regulates the height of the liquid in the tank by opening or closing. When both valves are in operation, liquid accumulates in the tank, and this can be expressed mathematically as follows:

$Q_{in} - Q_{out} = accumulation$

However, the accumulation of liquid can also be expressed as the volume of liquid that changes over time due to the operation of the two valves. The change in time occurs because the valves are not always open or closed.

$accumulation = \frac{\Delta V}{dt}$

If we consider a tank with a constant cross-sectional area, we can write the volume as the product of the area and the height of the tank. However, in this case, the height changes, and the result is:

$\Delta V = A * dh$

The output flow can be expressed as the driving force that pushes the liquid out of the tank. This force can be calculated using the following equation:

$Q_{out} = \frac{\rho g h}{R}$

where R is the resistance of the valve used to discharge the tank. The value of the resistance can be determined using the Darcy-Weisbach equation:

$\Delta P = Lf\frac{\rho}{2}\frac{v^{2}}{2}$

where $L$ is the longitude from the pipe for the output valve. $\rho$ is the density of the liquid, $v$ is the velocity of the flow, $D$ is the diameter of the pipe (connected with the valve), and $f$ is the friction factor. The friction factor can be calculated using the Colebrook-White equation or using a Moody diagram. Using the Moody diagram you only need to calculate the Reynolds number and the relative roughness that dependes of the material of the pipe.

$Reynolds number = \frac{\rho v D}{\mu}$

$roughness = \frac{\epsilon}{D}$

After performing these calculations, the values can be checked on the graph below.

![Moody Diagram](Moody_diagram.png)

You have to draw a vertical line (green) depending on the Reynolds number you obtained and a horizontal line (green) depending on the value of relative roughness you have on the pipe. The joint between the lines are the friction factor. Also, don´t forget that the Reynolds number tells you if the flow is laminar, in transition (between laminar and turbulent) or is in complete turbulence. 

After using the Darcy-Weisbach the calculation of the resistance is as follows:

$R = \frac{\Delta P}{\rho v^{2}A} * K [\frac{Ns}{m^{5}}]$

where K is a correction factor depending on the geometry of the pipe. 

__I have to say that i am not an expert in the subject but i do my best to simulate the control system using all this information__


At the end the differential equation can be writted as:

$\frac{AR}{\rho g}\frac{dh}{dt} + h = Q_{in}\frac{R}{\rho g}$

### Control system

First i rewritte the equation leaving the term with high order from the differential equation in one side.

\frac{dh}{dt} = \frac{Q_{in}}{A} - h(\frac{\rho g}{A R})

The objective of the control system is that the liquid reach a determined height. This means that the error must be zero when the liquid reach that particular height. To do this is necessary find a Lyapunov function that helps to the system to gain energy and whose derivative indicates that the system losses energy. This means that the Lyapunov function must be positive and it´s derivative must be negative. 

- Objectives:

1. $V = \frac{1}{2}e_{h}^{2} > 0$
2. $\dot{V} = -ke_{h}^{2} < 0$

The error can be written as the difference between the desired height and the actual height of the liquid. 

$e_{h}(t) = h_{d} - h(t)$

Whose derivative is equal to:

$\dot{e_{h}}(t) = \frac{dh_{d}}{dt} - \frac{dh}{dt}$

But the value in this case of the desired height is constant so it´s derivative is zero.

$\dot{e_{h}}(t) = - \frac{dh}{dt}$

The loss of energy from the system is ideal for the previous case because the real loss of energy can be written as follows:

$\dot{V} = e_{h}\dot{e_{h}}$

In this case i set the equation of ideal loss with the real loss to obtain:

$-ke_{h}^{2} = e_{h}\dot{e_{h}}$

$\dot{e_{h}} = -ke_{h}$

$-\frac{dh}{dt} = -k(h_d - h)$

Now i set the differential equation in the previous equation:

$\frac{Q_{in}}{A} - h(\frac{\rho g}{A R}) = ke_{h}$

Where the input to the system is the input flow $Q_{in}$, so in the equation we separate this value to one side of the equation:

$Q_{in} = Ake_{h} + h(\frac{\rho g}{R})$

And this is the control function i used to develop the simulation on Matlab and Simulink. The value of the resistance used is invented for test purpose, but i hope it helps to someone. 












