function y = setUnits
%SETUNITS Create an interface structure to the PREAL data type.
% y = SETUNITS returns a structure containing predefined SI units, as
% well as non-SI units, derived units, physical constants etc., all scalars
% of type PREAL. The field names use conventional notation as much as
% possible. Use this structure to define PREAL variables instead of
% specifying dimensions explicitly, through the PREAL constructor or SET
% function.
% 
% Based on:
% Fortran 90 Module 'SI_UNITS'
% Copyright (C) 2002  Grant W. Petty
% Written by Grant W. Petty and Michael A. Walters with suggestions by
% Howard W. Ludwig


%% Define base units
y.meter    = preal(1,[1 0 0 0 0 0 0]);
y.kilogram = preal(1,[0 1 0 0 0 0 0]);
y.second   = preal(1,[0 0 1 0 0 0 0]);
y.kelvin   = preal(1,[0 0 0 1 0 0 0]);
y.ampere   = preal(1,[0 0 0 0 1 0 0]);
y.mole     = preal(1,[0 0 0 0 0 1 0]);
y.candela  = preal(1,[0 0 0 0 0 0 1]);
% And the radian as the base measure of angle (dimensionless).
y.radian   = preal(1,[0 0 0 0 0 0 0]);

%% Abbreviations
y.m   = y.meter;
y.kg  = y.kilogram;
y.s   = y.second;
y.K   = y.kelvin;
y.A   = y.ampere;
y.mol = y.mole;
y.cd  = y.candela;
y.rad = y.radian; % not to be confused with unit of radiation

%% Define non-dimensional multipliers
y.yotta = 1.0e+24;
y.zetta = 1.0e+21;
y.exa   = 1.0e+18;
y.peta  = 1.0e+15;
y.tera  = 1.0e+12;
y.giga  = 1.0e+09;
y.mega  = 1.0e+06;
y.kilo  = 1.0e+03;
y.hecto = 1.0e+02;
y.deka  = 1.0e+01;  y.deca = 1.0e+01;
y.deci  = 1.0e-01;
y.centi = 1.0e-02;
y.milli = 1.0e-03;
y.micro = 1.0e-06;
y.nano  = 1.0e-09;
y.pico  = 1.0e-12;
y.femto = 1.0e-15;
y.atto  = 1.0e-18;
y.zepto = 1.0e-21;
y.zocto = 1.0e-24;

%% Derived units
y.steradian = y.radian^2;
y.degree    = y.radian*pi/180;
y.hertz     = 1/y.second;
y.newton    = y.kilogram*y.meter/y.second^2;
y.pascal    = y.newton/y.meter^2;
y.joule     = y.newton*y.meter;
y.watt      = y.joule/y.second;
y.coulomb   = y.ampere*y.second;
y.volt      = y.joule/y.coulomb;
y.ohm       = y.volt/y.ampere;
y.tesla     = y.newton/y.ampere/y.meter;
y.gauss     = y.tesla/1e4;

%% More abbreviations
y.deg = y.degree;
y.Hz  = y.hertz;
y.N   = y.newton;
y.Pa  = y.pascal;
y.J   = y.joule;
y.W   = y.watt;
y.C   = y.coulomb;
y.V   = y.volt;
y.T   = y.tesla;
y.G   = y.gauss;

%% Definitions of common physical constants
% 2018 NIST reference <http://physics.nist.gov/cuu/index.html>
y.speed_of_light      = 299792458*y.meter/y.second;
y.planck              = 6.62607015e-34*y.joule*y.second;
y.h_bar               = 1.054571817e-34*y.joule*y.second;
y.avogadro            = 6.02214076e+23/y.mole;
y.universal_gas       = 8.314462618*y.joule/(y.mole*y.kelvin);
y.boltzmann           = 1.380649e-23*y.joule/y.kelvin;
y.electron_charge     = 1.602176634e-19*y.coulomb;
y.electron_rest_mass  = 9.1093837015e-31*y.kilogram;
y.proton_rest_mass    = 1.67262192369e-27*y.kilogram;
y.stefan_boltzmann    = 5.670374419e-8*y.watt*y.m^-2*y.kelvin^-4;
y.gravity             = 6.67430e-11*y.meter^3/(y.kilogram*y.second^2);

%% Selected units of time
y.minute        = 60.0*y.second;
y.min           = y.minute;
y.hour          = 60.0*y.minute;
y.hr            = y.hour;
y.day           = 24.0*y.hour;
y.year          = 365.24*y.day;
y.yr            = y.year;

%% Selected units of length
y.angstrom          = 1.0e-10*y.meter;
y.micrometer        = y.micro*y.meter;
y.micron            = y.micrometer;
y.millimeter        = y.milli*y.meter;
y.mm                = y.millimeter;
y.centimeter        = y.centi*y.meter;
y.cm                = y.centimeter;
y.kilometer         = y.kilo*y.meter;
y.km                = y.kilometer;
y.inch              = 2.54*y.centimeter;
y.foot              = 12.0*y.inch;
y.yard              = 3.0*y.foot;
y.statute_mile      = 5280.0*y.foot;
y.mile              = y.statute_mile;
y.light_year        = y.speed_of_light*y.year;
y.parsec            = 3.085680e+16*y.meter;
y.pc                = y.parsec;

%% Selected units of volume
y.liter              = 1.0e-3*y.meter^3;
y.cc                 = y.centimeter^3;
y.imperial_gallon_uk = 4.54609*y.liter;

%% Selected units of linear velocity
y.kilometer_per_hour = y.kilometer/y.hour;
y.kph                = y.kilometer_per_hour;
 
%% Selected units of mass
y.gram                 = y.kilogram/y.kilo;
y.g                    = y.gram;
y.atomic_mass_unit     = 1.0e-3*y.kilogram/(y.avogadro*y.mole);
y.amu                  = y.atomic_mass_unit;
y.slug                 = 1.459390e+1*y.kilogram;
y.solar_mass           = 1.9884e+30*y.kilogram;
y.earth_mass           = 5.9722e+24*y.kilogram;

%% Selected units of force
y.dyne = 1.0e-5*y.newton;

%% Selected non-SI units of pressure
y.bar          = 1.0e+5*y.pascal;
y.millibar     = y.milli*y.bar;
y.mbar         = y.millibar;
y.atmosphere   = 1.01325e+5*y.pascal;
y.atm          = y.atmosphere;
y.millimeterHg = 133.322*y.pascal;
y.mmHg         = y.millimeterHg;
y.GPa          = y.giga*y.pascal;

%% Selected units of energy
y.electronvolt = y.electron_charge*y.volt;
y.eV           = y.electronvolt;
y.erg          = 1.0e-7*y.joule;
y.btu          = 1055.05585*y.joule;
y.calorie      = 4.184*y.joule;
y.gram_tnt     = 1000*y.calorie;
y.ton_tnt      = 1e6*y.gram_tnt;
y.kiloton_tnt  = 1000*y.ton_tnt;

%% Selected astronomical constants, from the IAU NSFA and the Navy's almanac (http://asa.usno.navy.mil)
y.solar_mass_parameter = 1.32712440041e20*y.meter^3*y.second^-2;
y.earth_mass_parameter = 3.986004356e14*y.meter^3/y.second^2;
y.astronomical_unit    = 149597870700*y.meter;
